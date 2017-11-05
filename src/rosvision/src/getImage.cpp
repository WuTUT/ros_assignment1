#include <ros/ros.h>
#include "std_msgs/String.h"
#include <rosvision/ROI.h>
#include <image_transport/image_transport.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <stdio.h>
using namespace cv;
using namespace std;

string Cascade_mode ="/home/wu/MLData/harrdata/cascade.xml";
CascadeClassifier Mycascade;
Mat detectAndDisplay( Mat frame);
rosvision::ROI msg;
int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_publisher");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("camera/image", 1);
  ros::NodeHandle n;
  ros::Publisher chatter_pub = n.advertise<rosvision::ROI>("chatter", 1000);
    cv::VideoCapture cap("/home/wu/fujian3.avi");
    cv::Mat frame;
    cv::Mat roi;
    
    sensor_msgs::ImagePtr frame_msg;
    ros::Rate loop_rate(5);
    
    while(ros::ok())
    {
        cap >> frame;
        if (!frame.empty())
        {

	    if(!Mycascade.load( Cascade_mode ))  { printf("[error] 无法加载级联分类器文件！\n");   return -1;    }
	    roi= detectAndDisplay(frame);	
            frame_msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
            //pub.publish(frame_msg);
	    
	    chatter_pub.publish(msg);
            cv::waitKey(1);
        }
        ros::spinOnce();
        loop_rate.sleep();
    }
}
Mat detectAndDisplay( Mat frame)
{
    std::vector<Rect> pedestrain;
    Mat frame_gray(frame.size(),CV_8U);
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
   // Mycascade.detectMultiScale( frame_gray, pedestrain, 1.1, 5, 0, Size(40,40),Size(70,70) );//test small samples high
   //Mycascade.detectMultiScale( frame_gray, pedestrain, 1.1, 5, 0, Size(40,40),Size(120,120) );//test big samples low
   Mycascade.detectMultiScale( frame_gray, pedestrain, 1.1, 3, 0, Size(40,40),Size(120,120) );
    for( int i = 0; i < pedestrain.size(); i++ )  {
        /*rectangle(frame,
                  pedestrain[i],
                  Scalar(0, 255, 0),
                  1);*/

       
       msg.x=pedestrain[i].x;
       msg.y=pedestrain[i].y;
       msg.width=pedestrain[i].width;
       msg.height=pedestrain[i].height;
       
//cout<<msg.x<<" "<<msg.y<<" "<<msg.width<<" "<<msg.height<<endl;
  	return frame;
}
}


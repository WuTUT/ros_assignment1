#include "ros/ros.h"
#include "std_msgs/String.h"
#include <rosvision/ROI.h>
#include <image_transport/image_transport.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <iostream>
using namespace std;
using namespace cv;
void chatterCallback(rosvision::ROI msg)
{
	
  cout<<"I heard:"<<msg.x<<" "<<msg.y<<" "<<msg.width<<" "<<msg.height<<endl;	
}

int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "drawer");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
  ros::spin();

  return 0;
}


# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rosvision: 1 messages, 0 services")

set(MSG_I_FLAGS "-Irosvision:/home/wu/rosopencv/src/rosvision/msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rosvision_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wu/rosopencv/src/rosvision/msg/ROI.msg" NAME_WE)
add_custom_target(_rosvision_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rosvision" "/home/wu/rosopencv/src/rosvision/msg/ROI.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rosvision
  "/home/wu/rosopencv/src/rosvision/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosvision
)

### Generating Services

### Generating Module File
_generate_module_cpp(rosvision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosvision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rosvision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rosvision_generate_messages rosvision_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wu/rosopencv/src/rosvision/msg/ROI.msg" NAME_WE)
add_dependencies(rosvision_generate_messages_cpp _rosvision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosvision_gencpp)
add_dependencies(rosvision_gencpp rosvision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosvision_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rosvision
  "/home/wu/rosopencv/src/rosvision/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosvision
)

### Generating Services

### Generating Module File
_generate_module_lisp(rosvision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosvision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rosvision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rosvision_generate_messages rosvision_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wu/rosopencv/src/rosvision/msg/ROI.msg" NAME_WE)
add_dependencies(rosvision_generate_messages_lisp _rosvision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosvision_genlisp)
add_dependencies(rosvision_genlisp rosvision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosvision_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rosvision
  "/home/wu/rosopencv/src/rosvision/msg/ROI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosvision
)

### Generating Services

### Generating Module File
_generate_module_py(rosvision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosvision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rosvision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rosvision_generate_messages rosvision_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wu/rosopencv/src/rosvision/msg/ROI.msg" NAME_WE)
add_dependencies(rosvision_generate_messages_py _rosvision_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rosvision_genpy)
add_dependencies(rosvision_genpy rosvision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rosvision_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosvision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rosvision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(rosvision_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rosvision_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosvision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rosvision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(rosvision_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rosvision_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosvision)
  install(CODE "execute_process(COMMAND \"/home/wu/anaconda2/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosvision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rosvision
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(rosvision_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rosvision_generate_messages_py std_msgs_generate_messages_py)
endif()

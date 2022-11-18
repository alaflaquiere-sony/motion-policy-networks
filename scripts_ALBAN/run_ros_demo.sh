if [ -z ${ALREADYINSTALLED+x}]
then
    mkdir -p /root/catkin_ws/src
    cd /root/catkin_ws/src
    ln -s /root/mpinets mpinets
    cd /root/catkin_ws
    catkin build
    source /root/catkin_ws/devel/setup.bash

    cd /root/mpinets
    pip install -e .

    export ALREADYINSTALLED=1
fi

roslaunch mpinets_ros visualize.launch mdl_path:=/root/mpinets/weights/mpinets_hybrid_expert.ckpt point_cloud_path:=/root/mpinets/real_world_data/mpinets_real_point_cloud_data.npy
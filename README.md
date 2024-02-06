# image_pipeline_docker

Build the docker image by executing:
```
cd .devcontainer
bash build.sh
```
Run the docker container:
```
cd ..
bash run.sh
```
In container:
```
ros2 launch stereo_image_processing stereo_image_proc.launch.py
```
Folder "bags" was prepared as volume to testing algorithm by using rosbags.

nvidia-docker run --rm -it \
    -v /allen:/allen \
    -v /allen/programs/celltypes/workgroups/em-connectomics/gayathrim/gits/cnn-registration:/root/cnn-registration \
    -p 9999:9999 \
    --ipc=host \
    --shm-size 8G \
    cnn_registration \
    /bin/bash -c "jupyter notebook --allow-root --ip 0.0.0.0 --notebook-dir=/root/cnn-registration"
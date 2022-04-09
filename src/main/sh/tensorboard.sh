source src/main/sh/hpc/config.sh
LOCAL_PORT=18234
ssh -N -f -L localhost:${LOCAL_PORT}:localhost:$HPC_PORT $SJSU_ID@coe-hpc1.sjsu.edu
open http://localhost:$LOCAL_PORT

source src/main/sh/hpc/config.sh
LOCAL_URL="localhost:18234"
ssh -i "$SSH_ID" -N -f -L $LOCAL_URL:localhost:$HPC_PORT $HPC_HOST
open http://$LOCAL_URL

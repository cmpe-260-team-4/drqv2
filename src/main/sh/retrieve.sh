source src/main/sh/hpc/config.sh
scp -i "$SSH_ID" -r "$HPC_HOST:~/cmpe260/drqv2/exp_local" ~/Downloads

source src/main/sh/hpc/config.sh
ssh-keygen -t rsa -b 4096 -C "$SJSU_EMAIL" -f "$SSH_ID" -N ""
ssh-copy-id -i "$SSH_ID" "$HPC_HOST"

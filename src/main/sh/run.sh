source src/main/sh/hpc/config.sh
GPU_IP=$(sbatch --export=ALL,TASK=$1 src/main/sh/drqv2.sh | awk '{print $4;}' | xargs -I {} cat slurm-{}.out | grep GPU_IP | cut -d "=" -f2)
ssh -N -f -L localhost:$HPC_PORT:localhost:$GPU_PORT "$SJSU_ID@$GPU_IP"

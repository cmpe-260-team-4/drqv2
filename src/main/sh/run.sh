source src/main/sh/hpc/config.sh
SLURM_JOB_ID=$(sbatch --export=ALL,TASK=$1 src/main/sh/drqv2.sh | awk '{print $4;}')
sleep 20
GPU_IP=$(grep GPU_IP "slurm-$SLURM_JOB_ID.out" | cut -d "=" -f2)
ssh -N -f -L localhost:$HPC_PORT:localhost:$GPU_PORT "$SJSU_ID@$GPU_IP"

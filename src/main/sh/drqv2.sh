#!/bin/bash
#SBATCH --job-name=drqv2
#SBATCH --ntasks=1
#SBATCH -p gpu
#SBATCH --gres=gpu
#SBATCH --time=48:00:00
#SBATCH --mail-type=END
GPU_IP=$(hostname -i)
echo "GPU_IP=$GPU_IP"
cd ~/cmpe260/drqv2 || exit
source src/main/sh/hpc/config.sh
module load cuda/10.1
eval "$(conda shell.bash hook)"
conda activate drqv2
# note: the & starts the program in the background so we can run tensorboard while it's running
python train.py task="$TASK" &
tensorboard --logdir exp_local --port "$GPU_PORT"

# because of https://namespaceit.com/blog/the-unauthenticated-git-protocol-on-port-9418-is-no-longer-supported and
# https://github.blog/2021-09-01-improving-git-protocol-security-github/, you have to run this:
git config --global url."https://".insteadOf git://
conda env create -f conda_env.yml
conda activate drqv2

# I dropped down to cuda 10.1 because of this: https://github.com/Deep-MI/FastSurfer/issues/39
# When I ran `nvidia-smi`, it showed me that the NVIDIA GPU on the HPC was running CUDA 10.1
# srun -p gpu --gres=gpu -n 1 -N 1 -c 2 --pty /bin/bash
# https://github.com/Deep-MI/FastSurfer/issues/39#issuecomment-735691972
# nvidia-smi

# https://pytorch.org/get-started/previous-versions/#v171
pip install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
#conda env update -f conda_env.yml

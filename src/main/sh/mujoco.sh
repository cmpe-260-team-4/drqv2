mkdir ~/.mujoco
cd ~/.mujoco || exit
curl -O https://www.roboti.us/file/mjkey.txt
curl -O https://www.roboti.us/download/mujoco200_linux.zip
unzip mujoco200_linux.zip
mv mujoco200_linux mujoco200
rm mujoco200_linux.zip
#MUJOCO_PY_MJKEY_PATH=~/.mujoco/mjkey.txt
#MUJOCO_PY_MUJOCO_PATH=~/.mujoco
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco200/bin

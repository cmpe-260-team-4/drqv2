mkdir ~/.mujoco
cd ~/.mujoco || exit
curl -O https://www.roboti.us/file/mjkey.txt
curl -O https://www.roboti.us/download/mujoco200_linux.zip
unzip mujoco200_linux.zip
mv mujoco200_linux mujoco200
rm mujoco200_linux.zip

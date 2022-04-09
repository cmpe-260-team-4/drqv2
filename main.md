# CMPE 260 Team 4: DrQ-v2

This guide demonstrates how to run DrQ-v2 on the SJSU HPC system.

## Initialize

The following instructions demonstrate how to initialize your system to access the HPC.

### Clone repo locally

Start by cloning [the drqv2 repository] locally. Assuming you've already configured an SSH key pair with GitHub, you can clone the repo as follows:

```shell
git clone git@github.com:cmpe-260-team-4/drqv2.git
```

If you haven't configured SSH keys, you should probably do that first. If you're in a hurry, though, you can download the repo as follows:

```shell
git clone https://github.com/cmpe-260-team-4/drqv2.git
```

### Join network capable of reaching HPC system

If you are connected to the SJSU_premier Wi-Fi network, you can access the HPC system directly. If you need to access the HPC system from home, you must first connect to the SJSU VPN. If you need help, follow the instructions in *How to Connect to VPN using Cisco AnyConnect* for [macOS](https://www.sjsu.edu/it/docs/connectivity/How%20to%20Connect%20to%20VPN%20Using%20Cisco%20AnyConnect-For%20Macs-Students.pdf) or [Windows](https://www.sjsu.edu/it/docs/connectivity/How%20to%20Connect%20to%20VPN%20Using%20Cisco%20AnyConnect-For%20Windows-Students.pdf).

### Upload SSH public key to HPC system

Rather than entering your SJSU password each time you want to connect to the HPC system, you are encouraged to create an SSH key pair, then upload the public key to the HPC system. Follow the steps below to achieve this:

1. Change to the root directory of the drqv2 repository:
   ```shell
   cd drqv2
   ```
2. Open [config.sh](src/main/sh/hpc/config.sh).
3. Set `SJSU_ID` and `SJSU_EMAIL` appropriately; for example:
    ```shell
    export SJSU_ID=123456789
    export SJSU_EMAIL=first.last@sjsu.edu
    ```
4. Run [init.sh](src/main/sh/hpc/init.sh):
    ```shell
    src/main/sh/hpc/init.sh
    # enter your SJSU password
    ```
5. Run [connect.sh](src/main/sh/hpc/connect.sh):
    ```shell
    src/main/sh//hpc/connect.sh
    ```

### Clone repo on the HPC system

Clone the repo to your environment on the HPC system and change into its directory:

```shell
git clone https://github.com/cmpe-260-team-4/drqv2.git
cd drqv2
```

### Configure MuJoCo

Run the following script to configure MuJoCo:

```shell
src/main/sh/mujoco.sh
```

### Configure Conda environment

If you haven't installed conda in your HPC environment before, you may need to do that first.

Run the following script to configure the `drqv2` conda environment:

```shell
src/main/sh/conda.sh
```

### Configure drqv2.sh

With everything configured, you should now conceivably be able to run DrQ-v2 on the HPC system. Before you do, though, you are encouraged to configure the script to send a completion email to your email address by adding the following line to the slurm preface of [drqv2.sh](src/main/sh/drqv2.sh):

```shell
#SBATCH --mail-user=first.last@sjsu.edu
``` 

## Run DrQ-v2

Now, run DrQ-v2 via:

```shell
sbatch --export=ALL,TASK=quadruped_walk drqv2.sh
```

To run a different task, replace `quadruped_walk` in the command above with one of the tasks below:

* `acrobot_swingup`
* `cartpole_balance`
* `cartpole_balance_sparse`
* `cartpole_swingup`
* `cartpole_swingup_sparse`
* `cheetah_run`
* `cup_catch`
* `finger_spin`
* `finger_turn_easy`
* `finger_turn_hard`
* `hopper_hop`
* `hopper_stand`
* `humanoid_run`
* `humanoid_stand`
* `humanoid_walk`
* `pendulum_swingup`
* `quadruped_run`
* `quadruped_walk`
* `reach_duplo`
* `reacher_easy`
* `reacher_hard`
* `walker_run`
* `walker_stand`
* `walker_walk`

By default, [drqv2.sh](src/main/sh/drqv2.sh) will run DrQ-v2 on a GPU in batch mode for the maximum permitted time (48 hours). It performs the training in the background and starts `tensorboard` simultaneously so you can tunnel through the HPC to watch its progress. Instructions on how to follow the training via TensorBoard on your local machine are included in [Track via tensorboard](#track-via-tensorboard).

### Track a job

To track the status of a job, use `squeue`. Utilize the `-u` parameter to isolate *your* jobs:

```shell
squeue -u $USER
```

Assuming you have active jobs, you should see them in the output; for example:

```shell
JOBID PARTITION NAME      USER      ST  TIME  NODES NODELIST(REASON)
29773 gpu       drqv2     123456789 R   2:09  1     g5
```

### Cancel a job

To cancel a running job, pass the job's identifier to `scancel`. For example, to cancel the job from the output above:

```shell
scancel 29773
```

### Retrieve results

As `drqv2.sh` runs, it will produce results within the `exp_local` directory. To retrieve results on your local machine, open a local terminal to the root of the `drqv2` repository then run [retrieve.sh](src/main/sh/retrieve.sh):

```shell
src/main/sh/retrieve.sh
```

### Track via tensorboard

In order to track the training process locally, you need to create two SSH tunnels:

1. [From the HPC to a GPU running `drqv2`](#tunnel-from-hpc-to-gpu)
2. [From your local machine to the HPC](#tunnel-from-local-machine-to-hpc)

#### Tunnel from HPC to GPU

Start by connecting the HPC system:

```shell
src/main/sh/hpc/connect.sh
```

Then run DrQ-v2 supplying the task as a parameter:

```shell
cd cmpe260/drqv2
src/main/sh/run.sh pendulum_swingup
```

#### Tunnel from local machine to HPC

Now, create an SSH tunnel from a local terminal to the HPC system and open tensorboard in a local browser:

```shell
src/main/sh/tensorboard.sh
```

# Prerequisites

- Create a project in Google Cloud Platform.
- Install `gcloud` command line tool, and 'gcloud auth login' to authenticate.
- Enable billing for your project.
- Make sure to enable Compute Engine API in your project.
- Apply the Limit increase for the GPU quota in your project.
    - Go to Google Cloud Console -> Compute Engine -> VM Instances.
    - Click on Create Instance.
    - Go to the compotion of the machine and select the GPU "NVIDIA T4".
    - You will see a message saying that you don't have enough quota for the GPU.
    - Click on the button "REQUEST QUOTA ADJUSTMENT".

# Steps
1. Create a VM instance with the following command:
```bash
terraform init
```
```bash
terraform apply
```
2. Set the Windows username and password for the instance from the Google Cloud Console, and save them in a file "secret.txt" in the root of the project.
3. Enable the serial port for the instance from the Google Cloud Console, and press the Connect to the serial console button.

# Notice
When you take break, make sure to stop the instance to avoid unnecessary charges.

# What you'll do
Play any game of your likings, I'll be playing Persona 3 Reload.
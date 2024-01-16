# Cloning GitHub Repository into a Virtual Machine
This guide explains how to clone and interact with repositories on Github.com using the Secure Shell Protocol (SSH) for authentication. Connecting via SSH involves using a private key file stored on your local machine.

## Step 1: Login to the Virtual Machine
Use the following command to connect to the GCP VM. Replace [VM_NAME] with the VM name.

```bash
gcloud compute ssh --zone "europe-west1-b" "[VM_NAME]" --project "data-science-405316"
```

## Step 2: Generate SSH Key Pair (if you haven't already)
First, check if key is already existing:
```bash
ls -al ~/.ssh
```
If there are no existing SSH keys like `id_rsa.pub`, `id_ecdsa.pub` or `id_ed25519.pub` generate a new key:

Paste the text below, replacing the email used in the example with your GitHub email address.

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## Step 3: Adding a new SSH key to your GitHub account
Copy the contents of your public key (`cat ~/.ssh/id_ed25519.pub`) and add it to your GitHub account's SSH keys. This can be done in the GitHub settings under "SSH and GPG keys."

1. In the upper-right corner of any page, click your profile photo, then click **Settings**.
2. In the "Access" section of the sidebar, click  SSH and GPG keys.
3. Click New SSH key or Add SSH key.
4. In the "Title" field, add a descriptive label such as "GCP VM laptop".
5. Select authentication as the type of key.
6. In the "Key" field, paste your public key.
7. Click Add SSH key.

You can find more information on cloning Github repository using SSH protocol [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux&tool=webui)

## Step 4: Install Git (if not already installed)
If Git is not installed on the GCP VM, use the following commands:

```bash
sudo apt update
sudo apt install git
```

## Step 5: Clone the GitHub Repository
Navigate to the directory where you want to clone the repository and use the git clone command.

```bash
git clone git@github.com:WorldDataLab/vm-setup.git
```

## Step 6: Verify the Clone
Navigate into the cloned repository and verify that everything is working:

```bash
cd vm-setup
ls
```


# Copying Files from GCP Bucket to VM
1. Connect to your VM using SSH
2. Execute the following command to copy files from the GCP bucket to your local VM:

```bash
gsutil -m cp -r gs://bucket-location /home/username/
```
`-m:` Enables the use of multiple threads, making the transfer faster for large datasets. \
`cp:` Indicates the copy command. \
`-r: `Recursively copies directories and their contents.

# Navigating RStudio Server
Below is a basic guide on navigating and using RStudio Server. This guide assumes you have RStudio Server installed and configured on the VM.

## Accessing RStudio Server
1. Open your web browser and navigate to the URL of the RStudio Server. It's usually in the format http://<VM_IP>:8787, where VM_IP is the external IP address of the virtual machine. 
2. Log in with your username and password.

## RStudio Interface Overview
Once logged in, you'll see the RStudio interface, which is divided into four panes:

1. **Source Editor (Top-Left):** This is where you can write and edit your R scripts or R Markdown documents.

2. **Console (Bottom-Left):** The R console is where you can directly interact with R by typing commands and seeing their output.

3. **Environment/History/Connections (Top-Right):** This pane shows your current R environment, command history, and any active database connections.

4. **Files/Plots/Packages/Help (Bottom-Right):** This pane includes tabs for viewing files in your working directory, viewing plots, managing packages, and accessing help documentation.


## Basic Navigation
1. Setting Your Working Directory:

Use the `setwd()` function or the Session > Set Working Directory menu to set your working directory.

2. Creating a New Script:

Click on File > New File > R Script to create a new R script.

3. Running Code:

Highlight the code in the script editor and click on the "Run" button or use the keyboard shortcut (Ctrl + Enter) to execute the code in the console.

4. Installing and Loading Packages:

Use the `install.packages()` function to install packages, and `library()` or `require()` to load them.

5. Managing Files:

Use the Files tab in the bottom-right pane to navigate your working directory. You can upload, download, and manage files here.


# Adding and removing files from Google Cloud Storage

## Downloading
These scripts download files from a bucket to a local directory on a VM.

First, edit `file_manifest` to list all of the files you'd like to download from GCS to your VM.  Then, run `./download_manifest.sh` to download the files.  The script will match GCS paths to local paths, so that

```bash
gs://world-data-pro/01_Data/R_2023_12_31/2023_12_31_apple_irq_2020_2017ppp/02_intermediary_data/01_012_india_survey_means.rds
```

downloads to

```bash
$BASE_DIR/01_Data/R_2023_12_31/2023_12_31_apple_irq_2020_2017ppp/02_intermediary_data/01_012_india_survey_means.rds
```

You can edit `BASE_DIR` within `download_manifest.sh` to set the target directory.

## Uploading

New files can be uploaded to GCS using `./upload_new_files.sh`.  This is take any new files located at `$BASE_DIR` and upload them to `gs://world-data-pro/` at the correct spot.  Again, you can change `$BASE_DIR` within `download_manifest.sh` to change the location you are uploading from.
# Connect to a Linux GUI from Windows Using RDP with xrdp

## Overview
The simplest and most commonly used method to connect to a Linux graphical interface from a Windows PC is with **RDP** via **xrdp**. This setup is widely preferred due to its ease of use, native Windows compatibility, and reliable performance.

## Why Use xrdp?

- **Ease of Use**: xrdp is straightforward to configure on Linux, and Windows has a built-in Remote Desktop Connection tool, eliminating the need for additional software on the Windows PC.

- **Widespread Compatibility**: The xrdp tool utilizes the RDP protocol, which is native to Windows, ensuring optimized compatibility and smooth integration.

- **Reliable Performance**: RDP delivers smooth, fast performance in most cases, even on average network connections.

## Setting Up xrdp on the Linux VM

To connect to the Linux graphical interface from a Windows PC, you first need to install and configure xrdp on the Linux VM. Follow these steps:

### Step 1: Install xrdp
Run the following commands to update your system and install xrdp:
```bash
sudo apt update
sudo apt install xrdp
```
### Step 2: Start and Enable the xrdp Service 
Start the xrdp service and configure it to start automatically at boot:
```bash
sudo systemctl enable xrdp
sudo systemctl start xrdp
```
### Step 3: Configure iptables to Allow RDP Port (3389)
Run the following command to allow traffic on port 3389 for RDP connections:
```bash
sudo iptables -A INPUT -p tcp --dport 3389 -j ACCEPT
```
To verify that the rule was successfully applied, list the current iptables rules:
```bash
sudo iptables -L
```
### Step 4: Verify xrdp is Listening on Port 3389
```bash
sudo ss -tuln | grep 3389
```
### Step 5: Connecting to linux Gui using Remote Desktop Connexion
Follow these steps to connect to your Linux VM's graphical interface using the Remote Desktop Connection tool in Windows:
- Press **Win + R** to open the Run dialog box.
- Type `mstsc` and press **Enter**. This will launch the **Remote Desktop Connection** application.
- In the Remote Desktop Connection window, enter the IP address of your Linux VM in the **Computer** field.
- Click **Connect**.
- A login window will appear. Enter your **username** and **password** for the Linux VM.

* If the connection is successful, the graphical interface of your Linux VM will appear in a new window on your Windows PC.
* If you encounter issues like the RDP window disappearing after entering the password, or a black screen after connecting, these are often caused by misconfigurations between xrdp and the desktop environment on your Linux VM.
 Follow the steps below to resolve these problems:
  1. Check and Update the xrdp Startup File , Open `startwm.sh` :
   ```bash
   sudo nano /etc/xrdp/startwm.sh
   ```
  2. Modify the content of the file to match this content : [Check out the `startwm.sh` file](https://github.com/Oumayma68/LinuxGUI-Connect-From-Windows/blob/main/startwm.sh)


  3. Restart the xrdp Service
  ```bash
  sudo systemctl restart xrdp
  ```
  
  4. Verify or Create the .xsession File in Your User Directory
 ```bash
 echo "startxfce4" > ~/.xsession
 ```
 Make sure the file has the correct execution permissions:
 ```bash
 chmod +x ~/.xsession
 ```
 5. Restart the VM and Reconnect
 ```bash
 sudo reboot
 ```
 6. If the Problem Persists , Ensure that Xfce is properly installed:
 ```bash
 sudo apt install --reinstall xfce4
 ```
You can now use your Linux environment remotely with full GUI access!


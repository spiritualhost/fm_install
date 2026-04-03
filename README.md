# FileMaker Assisted Silent Installation Automation Script

Claris FileMaker installation automation script.

## Description

A scripted out silent assisted installation for Claris FileMaker on Windows. Requires only minimal configuration and can then be deployed via GPO. No more painful individual user installations.

## Getting Started

### Dependencies

* 7zip
* Windows 10/11

### Installing

1) Find the FileMaker executable installer for your platform. It will often be the x64 executable directly received from Claris. We are also going to want to have available a networked volume accessible to all applicable users, so paste the executable there for Step 2.

![Executable Installer](assets/readme-filename.png)

2) Extract the executable to the networked volume using 7zip to gain access to its contents in directory form.

![Extract Executable Contents](assets/readme-extract-contents.gif)

Then, copy your Claris FileMaker license file, which should have the extension `.fmcert` into the `Files` directory (there should be a `.msi` file available there).

![Copy and Paste License to Files Directory](assets/readme-copy-license.gif)

3) Download the repo. This should be to a different location that the network share considered above. Edit the config file to reflect the extraction directory used.

```bash
git clone https://github.com/spiritualhost/fm_install.git
```

*The repo can be downloaded using the "Download ZIP" option under the code dropdown as well, bash and git are both unnecessary.*

The config file will be used later in the script runtime to connect to the head directory where the FileMaker files are now located. For example, if the extracted directory made in Step 2 was placed in `\\netshare\quelaag` and the directory name from Step 2 didn't change (which should match the original `.exe` name less the extension), the config file would be changed to reflect `\\netshare\quelaag\fmp_22.0.2.202_x64`.

![Edit Config File](assets/readme-edit-config.gif)

4) Move the edited config file to the root of the repo -- this will allow the script to properly make the network connection from any endpoint on the network that has access.

```bash
cd .\fm_install\
mv .\assets\config.bat .
```

You should now be prepared to run the script.

### Executing program

#### Run interactively

1) Right click the `fm_install.cmd` script and click "Run as Administrator."

#### Run as Active Directory GPO

1) Open the domain controller for the computers in question.

2) Open Windows Administrative Tools and start both Group Policy Management and Active Directory Users and Computers.

3) In AD Users and Computers, ensure that all PCs you want to use are in the same Organizational Unit (OU).

4) In Group Policy Management, follow the path to get to your specified OU in the left-hand menu, then click the folder. The window should now display three tabs "Linked Group Policy Objects," "Group Policy Inheritance," and "Delegation." Right click on the OU on the left-hand menu and click "Create a GPO in this domain, and Link it here..."

5) Go down the following path:

```bash
Computer Configuration
  └── Policies
        └── Windows Settings
              └── Scripts (Startup/Shutdown)
                    └── Startup
```

We do this instead of Logon/Logoff because we want the script to run as SYSTEM so UAC doesn't prevent the installation from happening silently.

Click `Properties`.

6) In the Scripts tab, click Add on the right-hand side of the window, then click Browse. Navigate to the network share where the `fm_install.cmd` script is located and set the file path to its location. Confirm everything and exit the domain controller.

The script will now run for all applicable computers when they next log on.

## Help

```bash
# Run this for help
.\fm_install.cmd /h

# Run this for verbose terminal output
.\fm_install.cmd /v
```

If you don't run the script as an administrator, the installation will stop for a UAC prompt. Don't use the `/h` flag when running as GPO.

## Authors

Contributors names and contact info

Ryan Piazza
[@spiritualhost](https://github.com/spiritualhost)

## License

This project is licensed under the GPL-3.0 License - see the LICENSE.md file for details

## Acknowledgments

* [Claris Docs](https://help.claris.com/en/pro-network-install-setup-guide/content/index.html)
* [More Information on Silent Assisted Installations](https://help.claris.com/en/pro-network-install-setup-guide/content/setting-up-silent-assisted-install-windows.html)
* [Instructions on Properly Setting up the Networked Volume](https://help.claris.com/en/pro-network-install-setup-guide/content/installing-network-windows.html)
* [More Information Personalization Properties](https://help.claris.com/en/pro-network-install-setup-guide/content/setting-personalization-properties.html)
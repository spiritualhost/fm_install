# Installing for MacOS

Installation of FileMaker for MacOS users is a slightly different process, so the tools to do so are located in this separate directory.

For macos specific instructions from Claris, [see here](https://help.claris.com/en/pro-network-install-setup-guide/content/installing-pro-macos.html).

## Getting Started

### Dependencies

### Instructions

#### Create a customized FileMaker Pro .pkg file using a command-line script

1) Clone the repo:

```bash
git clone https://github.com/spiritualhost/fm_install.git
cd fm_install/
```

2) Copy the FileMaker .dmg and license to an accessible location -- the script will request you find them.

3) Run the [customize_pkg.sh script](./customize_pkg.sh). It may require making it executable first:

```bash
cd macos/
chmod +x customize_pkg.sh
sudo ./customize_pkg.sh
```

4) The customized .pkg will now be available in the `working/` directory.

#### Deploy the customized .pkg to your user's computers

1) After confirming successful runtime of the [customize_pkg.sh script](./customize_pkg.sh), we will need to deploy the customized .pkg to users. Copy that .pkg to an appropriate location.

2) Command line arguments can be used to script out this process. Run the following command from within the `macos/` directory to get the help page.

```bash
./deploy_pkg.sh -h
```

3) When ready, install the package

```bash
chmod +x deploy_pkg.sh
sudo ./deploy_pkg.sh -p {{package.pkg}}
```

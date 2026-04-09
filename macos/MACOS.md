# Installing for MacOS

Installation of FileMaker for MacOS users is a slightly different process, so the tools to do so are located in this separate directory.

For macos specific instructions from Claris, [see here](https://help.claris.com/en/pro-network-install-setup-guide/content/installing-pro-macos.html).

## Getting Started

### Dependencies

### Instructions

#### Create a customized FileMaker Pro .pkg file using a command-line script

1) Clone the repo:

```bash
#a. Initialize a partial clone
git clone --filter=blob:none --no-checkout https://github.com/spiritualhost/fm_install.git
cd fm_install

#b. Ignore file permission changes (i.e., after making executable in step 2, allow pulling cleanly for repo updates)
git config --global core.fileMode false

#c. Enable sparse checkout
git sparse-checkout init --cone

#d. Specify the folder
git sparse-checkout set macos/

#e. Finalize the checkout
git checkout
```

2) Run the [customize_pkg.sh script](./customize_pkg.sh). It may require making it executable first:

```bash
cd macos/
chmod +x customize_pkg.sh
./customize_pkg.sh
```



#### Deploy the customized .pkg to your user's computers

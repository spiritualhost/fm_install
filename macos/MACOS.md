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

#b. Enable sparse checkout
git sparse-checkout init --cone

#c. Specify the folder
git sparse-checkout set macos/

#d. Finalize the checkout
git checkout
```

2) Run 


#### Deploy the customized .pkg to your user's computers

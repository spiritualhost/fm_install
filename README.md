# Project Title

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




## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
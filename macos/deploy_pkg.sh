#!/usr/bin/env bash

############################################################
# Help                                                     #
############################################################

Help()
{
   # Display Help
   echo "Deploy customized Claris FileMaker .pkg to MacOS users."
   echo
   echo "Syntax: scriptTemplate [-h|v|p] <options>"
   echo "Arguments:"
   echo "h                   Print this Help."
   echo "p {{package.pkg}}   Provide path to .pkg file"
   echo "v                   Verbose mode."
   echo
   exit 0
}

############################################################
# Command line options                                     #
############################################################

while getopts ":hp:" option; do
   case $option in
      h) # Display help
         Help   ;;   
      p) # Give script path to customized .pkg
         PKG_PATH="$OPTARG"   ;; 
      \?) # Invalid option
         echo "Error: invalid option. Run './deploy_pkg.sh -h' to get CLI options."
         exit 1
         ;;
   esac
done

############################################################
############################################################
# Main function                                            #
############################################################
############################################################
main() {
    # Install custom package
    echo "Installing custom FileMaker package located at $1"
    sudo installer -package "$1" -target "/Applications" || (echo "Error installing package, please try again" && exit 1)
    echo "Installation successful. Exiting program cleanly."
    exit 0
}

############################################################
# Entry Point                                              #
############################################################

# Was a package path provided
if [ -z "$PKG_PATH" ]; then
    echo "Error: -p <package> is required."
    echo
    Help
fi

# Check that path is valid (i.e., is .pkg)
if [[ "$PKG_PATH" != *.pkg ]]; then
    echo "Error: package parameter must be .pkg."
    echo
    Help
fi

# Enter the main function
main "$PKG_PATH"
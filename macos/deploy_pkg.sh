#!/usr/bin/env bash

############################################################
# Help                                                     #
############################################################

Help()
{
   # Display Help
   echo "Deploy customized Claris FileMaker .pkg to MacOS users."
   echo
   echo "Syntax: scriptTemplate [-h|v|p]"
   echo "options:"
   echo "h     Print this Help."
   echo "v     Verbose mode."
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
         PKG_PATH=$OPTARG   ;; 
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
    echo "Entering main function"
}




#Test if running interactively (TTY)
#if [ -t 0 ]; then
#    echo "Running in an interactive terminal."
#else    
#    echo "Input is piped or from a file."
#fi 

# Install custom package

############################################################
# Entry Point                                              #
############################################################

if [ -z "$PKG_PATH" ]; then
    echo "Error: -p <package> is required."
    Help
else
    main
fi

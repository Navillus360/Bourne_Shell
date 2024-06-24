fileName="USER INPUT"
fileExtension="USER INPUT"
Prompt () {
 read -p "Enter the name of your file: " fileName
 read -p "Enter the name of your extension (can be empty): " fileExtension
 PackageCheck
}

PackageCheck () {
 if [[ $(command -v plocate) ]] then;
  FindFile
 elif [[ $(command ! -v plocate) ]] then;
  PackageInstall
 fi
}

PackageInstall () {
 answer="USER INPUT"
 read -p "Package *plocate* is not installed! Would you like to install? [Y/n]"
 if [[ $answer == "Y" || $answer == "y" ]] then;
  sudo apt-get install plocate
 elif [[ $answer == "N" || $answer == "n" ]] then;
  echo "You need the package to find the file accurately!"
  exit
 else
  echo "Please choose an option!"
  PackageInstall
 fi
}

FindFile () {
 if [ -n $fileExtension ] 
 then
  locate $fileName
 else
  locate $fileName$fileExtension
 fi
}

Prompt
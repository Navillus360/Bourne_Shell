fileName="USER INPUT"
fileExtension="USER INPUT"
fileLocation="USER INPUT"
createFolder="USER INPUT"
filePermission="USER INPUT"

Menu (){
 userInput="USER INPUT"
 echo -e "[1] Create file \n[2] Remove file/folder"
 read -p "Input > " userInput
 case userInput in 
  "1")
  FileCreatePrompt;;
  "2")
  FileDeletePrompt;;
  *)
  clear
  echo "Please choose an option!"
  Menu;;
 esac
}

FileCreatePrompt () {
 clear
 read -p "What would you like to name your file? " fileName
 read -p "What extension will it be? " fileExtension
 read -p "Where shall the file go to? (if desktop, press enter)" fileLocation
 if [[ ! -z "$fileLocation" && -d "$fileLocation" ]]; then
  CreateFile $fileName $fileExtension $fileLocation
 elif [[ ! -z "$fileLocation" && ! -d "$fileLocation" ]]
  DirectoryCreatePrompt
 elif [[ -z "$fileLocation" ]]; then
  CreateFile $fileName $fileExtension $fileLocation
 fi
}

DirectoryCreatePrompt(){
 clear
 read -p "Directory doesn't exist. Would you like to create it? [Y/n] " createFolder
 if [[ $createFolder == "Y" || $createFolder == "y" ]]; then
  CreateDirectory
 elif [[ $createFolder == "N" || $createFolder == "n" ]]; then
  SetPermissions
 else
  echo "Please choose an option"
  DirectoryCreatePrompt
 fi
}

FileDeletePrompt (){
 clear
 confirmation="USER INPUT"
 echo "*WARNING* This will delete any files inputted, proceed with caution and backup before continuing"
 read -p "What is the files name?" fileName
 read -p "What extension is it? (leave blank if already done so)" fileExtension
 if [ ! -f "$fileName$fileExtension" ]; then
  echo "File does not exist!"
  Menu
 fi
 #If file does exist, continue with prompt
 read -p "Delete $fileName$fileExtension? Confirm [Y/n]"
 if [[ $confirmation == "Y" || $confirmation == "y" ]]; then
  find . -name $fileName
  rm $fileName$fileExtension
  echo "File deleted!"
 elif [[ $confirmation == "N" || $confirmation == "n" ]]; then
  echo "Please choose an answer!"
  Menu
 fi
}

CreateDirectory () {
 clear
 if [ ! -d "$fileLocation" ]; then 
  mkdir -p ~/Desktop/$fileLocation
  echo "Directory created!"
  SetPermissions
 fi
 if [ -d "$fileLocation" ]; then
  echo "Directory already exists!"
  SetPermissions
 fi
}

CreateFile () {
 clear
 if [ ! -f "$fileName$fileExtension" ]; then
  touch ~/Desktop/$fileLocation/$fileName$fileExtension
  echo "File created!"
 fi
 if [ -f "$fileName$fileExtension" ]; then
  echo "File already exists!"
 fi
}

SetPermissions () {
 clear
 read -p "Do you wish for the file to only be executed by you? (No will allow it to be executable by others)"
 if [[ $createFolder == "Y" || $createFolder == "y" ]]; then
  chmod u+x "$fileName$fileExtension"
  CreateFile
 elif [[ $createFolder == "N" || $createFolder == "n" ]]; then
  chmod +x "$fileName$fileExtension"
  CreateFile
 else
  echo "Please choose an option"
  SetPermissions
 fi
}

Menu
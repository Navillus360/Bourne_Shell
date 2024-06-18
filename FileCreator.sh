fileName="USER INPUT"
fileExtension="USER INPUT"
fileLocation="USER INPUT"
createFolder="USER INPUT"
filePermission="USER INPUT"

Prompt () {
 read -p "What would you like to name your file? " fileName
 read -p "What extension will it be? " fileExtension
 read -p "Where shall the file go to? (if desktop, leave blank)" fileLocation
 read -p "Would you like to create a directory if it doesn't exist?" createFolder
 if [[ $createFolder == "Y" || $createFolder == "y" ]]; then
  CreateDirectory
 elif [[ $createFolder == "N" || $createFolder == "n" ]]; then
  SetPermissions
 else
  echo "Please choose an option"
  Prompt
 fi
}

CreateDirectory () {
 if [ ! "-d $fileLocation" ]; then 
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
 if [ ! -f "$fileName$fileExtension" ]; then
  touch ~/Desktop/$fileLocation/$fileName$fileExtension
  echo "File created!"
 fi
 if [ -f "$fileName$fileExtension" ]; then
  echo "File already exists!"
 fi
}

SetPermissions () {
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

Prompt

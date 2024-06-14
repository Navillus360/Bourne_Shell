fileName="USER INPUT"
fileExtension="USER INPUT"
fileLocation="USER INPUT"
createFolder="USER INPUT"

Prompt () {
 read -p "What would you like to name your file? " fileName
 read -p "What extension will it be? " fileExtension
 read -p "Where shall the file go to? (if desktop, leave blank)" fileLocation
 read -p "Would you like to create a directory if it doesn't exist?" createFolder
 if [[ $createFolder == "Y" || $createFolder == "y" ]]; then
  CreateDirectory
 elif [[ $createFolder == "N" || $createFolder == "n" ]]; then
  CreateFile
}

CreateDirectory () {
 if [ ! "-d $fileLocation" ]; then 
  mkdir -p ~/Desktop/$fileLocation
  echo "Directory created!"
  CreateFile
 fi
 if [ -d "$fileLocation" ]; then
  echo "Directory already exists!"
  CreateFile
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

Prompt

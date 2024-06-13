Prompt () {
 fileName="USER INPUT"
 dirLocation=/"USER INPUT"
 read -p "What file would you like to find? (include file type)" fileName
 echo #
 read -p "Choose a target directory (Note! only target directorys from the desktop or the children folder this script is executed from!)" dirLocation
 dirLocationConvert=$dirLocation/$fileName
 FileCheck "$dirLocationConvert"
}

FileCheck () {
  for fileNames in "$dirLocation"/*; do
  if [[ $fileNames == $dirLocationConvert ]]; then
   echo "File is in the target Directory!"
  fi
  done
}

Prompt
for fileNames in *.sh; do
if [[fileNames == "FileChecker.sh"]];
then 
echo "Got the origin file!"
fi
echo "$fileNames"
done
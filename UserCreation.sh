Prompt () {
 input="USER INPUT"
 read -p "[ 1 ] == Add user \n [ 2 ] == Remove user \n [ 3 ] == Exit " input
 if [[ $input -eq 1 ]]; then
  CreateUser
 elif [[ $input -eq 2 ]]; then
  DeleteUser
 elif [[ $input -eq 3 ]]; then
  exit
 else
  echo "Please choose an option"
  Prompt
 fi
}

CreateUser (){
 userName="USER INPUT"
 password="USER INPUT"
 confirmation="USER INPUT"
 read -p "Username: " userName
 read -p "Password: " password
 read -p "You are about to create user \n$userName with the properties (user rights here). \nConfirm? [Y/n] " confirmation
 if [[ $confirmation == "Y" || $confirmation == "y" ]]; then
  CheckUser
 elif [[ $confirmation == "N" || $confirmation == "n" ]]; then
  Prompt
 else
  echo "Please choose an option"
  Prompt
 fi
}

DeleteUser () {
 userName="USER INPUT"
 confirmation="USER INPUT"
 read -p "Username: " userName
 read -p "You are about to delete user: $userName. \nConfirm? [Y/n] " confirmation
 if [[ $confirmation == "Y" || $confirmation == "y" && "$userName" != whoami ]];then 
  sudo userdel $userName
 elif [[ $confirmation == "Y" || $confirmation == "y" && "$userName" == whoami ]];then 
  echo "You cannot delete your own account!"
  Prompt
 elif [[ $confirmation == "N" || $confirmation == "n" ]]; then
  Prompt
 else
  echo "Please choose an option"
  DeleteUser
 fi
}

CheckUser () {
 if [[ ! -w "$userName" && "$userName" != whoami ]]; then #User does not exist
  sudo useradd -m -s /bin/bash $userName
  echo "$username:$password" | sudo chpasswd
  echo "$userName has been created."
 elif [[ -w "$userName" || "$userName" == whoami ]]; then #User does exist
  echo "User already exists!"
  Prompt
 fi
}

Prompt
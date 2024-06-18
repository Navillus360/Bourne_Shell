The UserCreation script allows users to create new user accounts or delete existing ones. 

Once the script is running, the user will be prompted to the previously mentioned options as well as exiting the terminal.

(Creating a new user)

Three prompts will appear after each user input: Username, Password, and Confirmation. The username and password prompts is to allow the admin/user to set the new user account username and password (not case-sensitive.) After that, the results of the inputs will appear with a [Y/n] to ensure the details are correct.

If they are, the new user account will be created. If not, they will return to the prompt/menu. However, if the details match that of the user running the script, the new user account will not be created.

(Deleting a user) 
Unlike creating a new user, only the Username and Confirmation prompts will appear for this action. However, there is a guard put in place where the users cannot delete themselves and instead be returned to the prompt/menu. 

							**Note!**
*The user that runs this script must have admin rights to perform user actions and use this script.*
*Although the Ubuntu OS will echo a warning about a bad password, the new user will still be created, so please ignore the message if it shows in the terminal.*

The FileCreator script allows for a more user-friendly way for files and directories to be created without having to open multiple folders and create one manually.

**(Creating the folder)**
After inputting the chosen name of the file and its extension, the user will be prompted for the file's directory to be created within (unless inputted N/n in the initial prompt.) Only the name of the location for the folder needs to be included (e.g. Scripts/FileCreatorProject), as the current implementation of the mkdir command will handle the ~/Desktop/ argument.

Once the rest of the prompt is finished, the file will be found within the created folder at its specified location. 

**(Creating the file)**
Compared to the folder creation, the user can set permissions for the file to be executed by the creator or other users on the system, allowing for a readily available file to execute in the terminal.

                                                                    **Note!**
If the chosen directory already exists, the file will continue to be created.
Make sure the naming of the parent folders that the directory will be created within is correct, as this can cause issues and create different variations.

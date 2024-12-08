# Random Scripts

A centralized repository for storing random scripts, batch bash snippets, and miscellaneous ideas.

## Script Files

* **Create_New_Project_Structure.bat:**
    * Add the name of your Project to set "PROJECT_NAME=HereIsYourProjectName"
    * Define the list of folders and optional placeholder files (format: folder or folder\subfolder:file.ext)
    * Example: `set "ITEMS=\:.gitignore \:README.md SRC LOGS DB CONFIG SRC:main.js SRC\MODS SRC\DOCS"` 
        * Note: When you are dropping a blank file into root, use `\.gitignore` or `test\testSubFolder:file.txt` 
    * Save as `projectname_creator.bat` and run.

## Usage

1. Edit and save `Create_New_Project_Structure.bat` (ensure it has a `.bat` extension).
2. Run the script by double-clicking or executing it from the command line.

## Notes

* These scripts are meant to be used as-is, without modification.
* You can customize the script files to fit your specific needs.

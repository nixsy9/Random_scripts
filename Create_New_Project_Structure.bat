@echo off


REM Disclaimer
REM Released under GNU GENERAL PUBLIC LICENSE
REM https://choosealicense.com/licenses/gpl-3.0/

REM --- CONFIGURATION SECTION ---
REM Define the project name (top-level folder)
set "PROJECT_NAME=AA_"

REM Define the list of folders and optional placeholder files (format: folder or folder\subfolder:file.ext)
REM set "ITEMS=src src:main.cpp assets assets\images:placeholder.png docs docs\guides:README.md tests tests\unit:sample_test.txt"
set "ITEMS=\:.gitignore \:README.md SRC LOGS DB CONFIG SRC:main.js SRC\MODS SRC\DOCS"

REM --- SCRIPT EXECUTION SECTION ---
echo Setting up project "%PROJECT_NAME%"...

REM Create the top-level project folder
if not exist "%PROJECT_NAME%" (
    echo Creating project folder: %PROJECT_NAME%
    mkdir "%PROJECT_NAME%"
) else (
    echo Project folder already exists: %PROJECT_NAME%
)

REM Loop through each item in the list
for %%I in (%ITEMS%) do (
    REM Check if the item contains a colon (indicating a file)
    echo %%I | findstr /C:":" >nul
    if %ERRORLEVEL% equ 0 (
        REM Split the item into folder and file
        for /f "tokens=1* delims=:" %%A in ("%%I") do (
            set "FOLDER=%%A"
            set "FILE=%%B"
            REM Ensure the folder exists before creating the file
            if not exist "%PROJECT_NAME%\%%A" (
                echo Creating folder: %PROJECT_NAME%\%%A
                mkdir "%PROJECT_NAME%\%%A"
            )
            REM Create the placeholder file
            if not exist "%PROJECT_NAME%\%%A\%%B" (
                echo Creating placeholder file: %PROJECT_NAME%\%%A\%%B
                echo Placeholder > "%PROJECT_NAME%\%%A\%%B"
            ) else (
                echo Placeholder file already exists: %PROJECT_NAME%\%%A\%%B
            )
        )
    ) else (
        REM If no colon, it's a folder to create
        if not exist "%PROJECT_NAME%\%%I" (
            echo Creating folder: %PROJECT_NAME%\%%I
            mkdir "%PROJECT_NAME%\%%I"
        ) else (
            echo Folder already exists: %PROJECT_NAME%\%%I
        )
    )
)

echo Project setup complete!
exit /b %ERRORLEVEL%

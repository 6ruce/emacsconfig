@echo off
set command=%1
set curPath=%~dp0
IF "%command%"=="sync" (
	call git pull origin master
	copy "%curPath%.emacs" "%curPath%../../.emacs" /Y 
	rmdir "%curPath%../elpa" /S /Q
	xcopy "%curPath%/elpa" "%curPath%../elpa" /S /I
) ELSE IF "%command%"=="syncb" (
	copy "%curPath%../../.emacs" "%curPath%.emacs" /Y 
	rmdir elpa /S /Q
	xcopy "%curPath%../elpa" "%curPath%/elpa" /S /I
	call git add .emacs 
	call git add emacssync.bat 
	call git add elpa/*
	call git status
	call git commit -m "Updating Emac enviroment"
	call git push origin master
) ELSE IF "%commad%"=="updated" (
	git pull origin master
	copy _vimrc ../_vimrc /Y 
) ELSE (
  echo Commands:
  echo     sync - synchronizes files in `sync` dir and vim files

)

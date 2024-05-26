REM use curl -o %TEMP%\script.bat https://raw.githubusercontent.com/letruxux/letruxux/main/ts-setup.bat && %TEMP%\script.bat

@echo off
mkdir src
call npm init -y
call npm i -g json
call json -I -f package.json -e "this.main = './src/index.ts'"
call json -I -f package.json -e "this.scripts.dev = 'npx nodemon .'"
call json -I -f package.json -e "this.scripts.start = 'npx ts-node .'"
call npm uninstall json
call npm i typescript nodemon ts-node --save-dev
call npx tsc --init
copy nul ./src/index.ts

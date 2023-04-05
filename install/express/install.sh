#!/bin/bash

read -p "Enter folder name? " folder_name
if [ "$folder_name" == "" ]; then
    echo "Please enter a correct folder name.";
    exit 1
fi

read -p "Enter path? $HOME/ (~/) + " folder_path
ORIGIN_PATH=$(pwd)
echo $ORIGIN_PATH
F_PATH=$HOME/$folder_path
echo $F_PATH
cd $F_PATH
/bin/mkdir -p $folder_name
cd $folder_name

# Copy files
/bin/mkdir -p src
cp $ORIGIN_PATH/index.ts ./src/
cp $ORIGIN_PATH/nodemon.json ./
cp $ORIGIN_PATH/tsconfig.json ./
cp $ORIGIN_PATH/package.json ./
cp $ORIGIN_PATH/.eslintrc ./
cp $ORIGIN_PATH/.prettierrc ./
cp $ORIGIN_PATH/.gitignore ./
cp $ORIGIN_PATH/.env ./
cp $ORIGIN_PATH/.env.example ./
cp $ORIGIN_PATH/.prettierignore ./
cp $ORIGIN_PATH/.eslintignore ./
cp $ORIGIN_PATH/README.md ./
cp -a $ORIGIN_PATH/.vscode ./
cp -a $ORIGIN_PATH/.husky ./

# Install dependencies
npm init --yes
git init

echo "Installing dependencies"
yarn add express
yarn add dotenv
yarn add body-parser

yarn add -D @types/express
yarn add -D @types/node
yarn add -D ts-node
yarn add -D typescript
yarn add -D nodemon
yarn add -D husky
# Eslint/prettier
yarn add -D @typescript-eslint/eslint-plugin
yarn add -D @typescript-eslint/parser
yarn add -D eslint
yarn add -D eslint-config-prettier
yarn add -D eslint-plugin-import
yarn add -D prettier 
yarn add -D eslint-plugin-prettier
yarn add -D eslint-plugin-simple-import-sort

chmod 777 ./.husky/pre-commit
npx husky install
npm pkg set scripts.prepare="husky install"
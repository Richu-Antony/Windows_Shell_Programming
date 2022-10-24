echo Routing to project root . . . 
cd /
cd \path\to\project\root
pause
echo Pulling current branch changes from Git . . .
git pull
pause
echo Checking out `dev` branch . . .
git checkout dev
pause
echo Pulling `dev` branch changes from Git . . .
git pull
pause
echo Checking out previous branch . . .
git checkout @{-1}
pause
echo Merging `dev` into current branch . . .
git merge dev
pause
echo Pushing merged changes into the current branch . . .
git push
pause
echo Starting the project via NPM . . .
npm start

cd "$1"

git checkout develop;

git pull

git branch $2;

git checkout $2;
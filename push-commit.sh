cd "$1"

branch=$(git rev-parse --abbrev-ref HEAD)

git commit -m "$2"

git checkout develop

git pull

git checkout $branch

git merge develop

git push origin $branch
cd "$1"

branch=$(git rev-parse --abbrev-ref HEAD)

read -p "¿Agregar src/* al commit? (y/n): " addSrc

if [ "$addSrc" = "y" ]; then
    git add src/*
fi

git commit -m "$2"

git checkout develop

git pull

if [ -n "$(git diff)" ]; then
    echo "Se han obtenido nuevos cambios."

    git checkout $branch

    read -p "¿Desea mergear los cambios? (y/n): " mergeValue

    if [ "$mergeValue" = "y" ]; then
        git merge develop
    fi

    git push origin $branch
else
    echo "No se han obtenido nuevos cambios."
    
    git checkout $branch

    git push origin $branch
fi
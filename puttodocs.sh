flutter build web

if [ $? -eq 0 ]; then
    echo "Flutter build web complete!"
else
    echo "Flutter build web failed, exiting..."
    exit 1
fi

rm -r docs/* #Remove everything in docs

if [ $? -eq 0 ]; then
    echo "Emptied the /docs folder."
else
    echo "Failed to empty the /docs folder, exiting..."
    exit 1
fi

cp -a build/web/ docs/ #Copy everything in build/web --> docs

if [ $? -eq 0 ]; then
    echo "Copied build/web --> docs."
else
    echo "Failed to copy build/web --> docs, exiting..."
    exit 1
fi
echo "Finished."
exit 0
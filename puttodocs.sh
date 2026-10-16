# Legacy manual deploy (Pages source = /docs). Prefer the GitHub Actions workflow in .github/workflows/deploy.yml.
flutter build web --release --wasm

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

cp -r build/web/* docs/ #Copy everything in build/web --> docs
find docs -name "*.symbols" -delete # Debug symbols are not needed in production

if [ $? -eq 0 ]; then
    echo "Copied build/web --> docs."
else
    echo "Failed to copy build/web --> docs, exiting..."
    exit 1
fi
echo "Finished."
exit 0
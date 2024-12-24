#
# Uninstalls conda and undoes changes made by install.sh
#
# It should be run only if no other customizations were made beyond what install.sh has applied.
#
set -ue
echo "#"
echo "# Removing Biostar Handbook code"
echo "#"

# Delete all files.
rm -rf ~/micromamba  ~/.condarc ~/.conda ~/.parallel
mv -f ~/.excelra.sh ~/.excelra.sh.bak

echo "# Uninstalled. See .excelra.sh.bak" > ~/.excelra.sh
echo "# Uninstall complete."
echo "#"

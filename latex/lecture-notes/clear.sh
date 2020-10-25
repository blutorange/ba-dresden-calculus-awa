# Called from the main build script
# Allows for additional files to be removed
set -e
shopt -s nullglob;
shopt -s globstar;

rm -f **/*.def;
rm -f **/*.definition;
rm -f **/*.example;
rm -f **/*.lof;
rm -f **/*.lot;
rm -f **/*.statement;

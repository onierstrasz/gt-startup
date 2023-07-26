#! /bin/sh
#
# Script to build GlamorousToolkit, install some scripts, and create a zipped backup.
# Caveat: this script assumes you are running on a Mac.
# probably some small changes will be needed for Linux or Windoze.
#
# Oscar Nierstrasz 2023
# https://creativecommons.org/licenses/by/4.0/
#

# This directory: where GT will be installed.
D=`dirname "$0"`
cd "$D"

# Folder where to find the scripts to install.
F="/Users/oscar/Library/CloudStorage/Dropbox/feenk/gt-files"

date=`date "+%Y-%m-%d@%Hh%M"`
gt="GT-${date}"
tmp=tmp$$

trap "echo EXIT;  exit" 0
trap "echo HUP;   exit" 1
trap "echo CTL-C; exit" 2
trap "echo QUIT;  exit" 3
trap "echo ERR;   exit" ERR

echo "Creating $gt"

mkdir $tmp
cd $tmp
time curl https://dl.feenk.com/scripts/mac.sh | bash

cd ..
mv $tmp/glamoroustoolkit $gt
rm -rf $tmp

run="$gt/__startGt.command"
cat > "$run" <<'eof'
#! /bin/sh
D=`dirname "$0"`
cd "$D"
ulimit -n 10240
./GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit \
  --image GlamorousToolkit.image
eof
chmod 0755 "$run"

ln -s "$gt" "__$gt"
# open "$gt"

cp "$F/__makeAliases.command" "$gt"
cp "$F/startup.st" "$gt"

echo zip -q -y -r "$gt.zip" "$gt"
zip -q -y -r "$gt.zip" "$gt"

exit

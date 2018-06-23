#!/bin/sh

# Define function to read property values
prop() {
   grep "$2" "$1"|cut -d'=' -f2
}

# Find VMX file and extract variables
PATH_NAME_EXT=$( find $1 -name '*.vmx' | head -n 1 )
NAME_EXT="${PATH_NAME_EXT##*/}"
NAME_ONLY=$(echo "$NAME_EXT" |  rev | cut -d'.' -f2-  | rev)
DISPLAY_NAME="$(prop $PATH_NAME_EXT 'displayname')"
DISPLAY_NAME="${DISPLAY_NAME%\"}"
DISPLAY_NAME="${DISPLAY_NAME# \"}"

echo "PATH_NAME_EXT=$PATH_NAME_EXT"
echo "NAME_EXT=$NAME_EXT"
echo "NAME_ONLY=$NAME_ONLY"
echo "DISPLAYNAME=$DISPLAY_NAME"

# Start replacing
echo "Replacing $PATH_NAME_EXT ..."

# 1) Remove lines starting with "remotedisplay.vnc" or "sharedFolder0"
# 2) Replace name like 'Lubuntu-17.10.1-amd64-core-vmware' with display name
sed -i '' -e "/^remotedisplay\.vnc/d;/^sharedFolder0/d;s/$NAME_ONLY/$DISPLAY_NAME/g" $PATH_NAME_EXT

# Rename VMX file
mv "$PATH_NAME_EXT" "$1/$DISPLAY_NAME.vmx"

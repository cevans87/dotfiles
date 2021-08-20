#!/bin/bash

set -e

_CWD=$CWD
trap 'dirs -c && cd $_CWD' exit

REPO=$(dirname $(realpath $0))

do_recursive_action_from_path_to_path () {
    RECURSIVE_ACTION=$1
    FROM_BASE_PATH=$2
    TO_BASE_PATH=$3
    if [ -d $FROM_BASE_PATH ] ; then
        pushd $FROM_BASE_PATH > /dev/null
        for RELATIVE_PATH in $(find . -type f -print) ; do
            mkdir -p $(dirname $TO_BASE_PATH/$RELATIVE_PATH)
            $RECURSIVE_ACTION $RELATIVE_PATH $TO_BASE_PATH/$RELATIVE_PATH
        done
        popd > /dev/null
    fi
}
do_xargs_action_if_file () {
    XARGS_ACTION=$1
    IF_FILE=$2
    if [ -f $IF_FILE ] ; then
        echo "xargs -a $IF_FILE $XARGS_ACTION"
        xargs -a $IF_FILE $XARGS_ACTION
    fi
}
do_for_each_line_action_if_file () {
    FOR_EACH_LINE_ACTION=$1
    IF_FILE=$2
    if [ -f $IF_FILE ] ; then
	for LINE in $(cat $IF_FILE) ; do
	    $FOR_EACH_LINE_ACTION $LINE
	done
    fi
}
LINK_HOME_PATHS=( $REPO/link/default $REPO/link/$HOSTNAME $REPO/link/$USER )
for HOME_LINK_PATH in ${LINK_HOME_PATHS[@]} ; do
    do_recursive_action_from_path_to_path "ln -fs" $HOME_LINK_PATH $HOME
done
COPY_HOME_PATHS=( $REPO/copy/default $REPO/copy/$HOSTNAME $REPO/copy/$USER )
for HOME_COPY_PATH in ${COPY_HOME_PATHS[@]} ; do
    do_recursive_action_from_path_to_path "cp -f" $HOME_COPY_PATH $HOME
done
APT_KEYS_PATHS=( $REPO/apt/keys/default $REPO/apt/keys/$HOSTNAME $REPO/apt/keys/$USER )
for APT_KEYS_PATH in ${APT_KEYS_PATHS[@]} ; do
    do_recursive_action_from_path_to_path "sudo cp -f" $APT_KEYS_PATH /usr/share/keyrings
done
APT_SOURCES_PATHS=( $REPO/apt/sources/default $REPO/apt/sources/$HOSTNAME $REPO/apt/sources/$USER )
for APT_SOURCES_PATH in ${APT_SOURCES_PATHS[@]} ; do
    do_recursive_action_from_path_to_path "sudo cp -f" $APT_SOURCES_PATH /etc/apt/sources.list.d
done
sudo apt-get update
APT_PACKAGES_FILES=( $REPO/apt/packages/default $REPO/apt/packages/$HOSTNAME $REPO/apt/packages/$USER )
for APT_PACKAGES_FILE in ${APT_PACKAGES_FILES[@]} ; do
    do_xargs_action_if_file "sudo apt-get install -y --no-install-recommends" $APT_PACKAGES_FILE
done
sudo apt-get clean
# Need to do this for each line since Snap CLI errors with multiple package arguments if packages
# are already installed.
SNAP_FILES=( $REPO/snap/default $REPO/snap/$HOSTNAME $REPO/snap/$USER )
for SNAP_FILE in ${SNAP_FILES[@]} ; do
    do_for_each_line_action_if_file "sudo snap install --classic" $SNAP_FILE
done

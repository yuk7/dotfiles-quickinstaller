#!/bin/bash

# Copyright (c) 2022 yuk7 <yukx00@gmail.com>
# Released under the MIT license
# http://opensource.org/licenses/mit-license.php
#<!--

OG_PWD="${PWD}"
TMP_DIR=`mktemp -d`

GH_REPO_USER="yuk7"
GH_REPO_NAME="dotfiles"
GH_REPO_URL="https://github.com/${GH_REPO_USER}/${GH_REPO_NAME}"
GH_REPO_SSH="git@github.com:${GH_REPO_USER}/${GH_REPO_NAME}"
GH_BRANCH="main"
ZIP_URL="${GH_REPO_URL}/archive/refs/heads/${GH_BRANCH}.zip"
TMP_ZIP="dotfiles.tmp.zip"
TMP_ZIP_ROOT_DIR="${GH_REPO_NAME}-${GH_BRANCH}"

DEST_DIR="${HOME}/dotfiles"

echo "dotfiles quick installer for *nix"
echo

# DESTDIR exists
if [ -e "${DEST_DIR}" ]
then
    echo "${DEST_DIR} already exists"
	exit
fi

cd "$TMP_DIR"

if type git 2>/dev/null 1>/dev/null
then
    git clone "${GH_REPO_URL}" -b "${GH_BRANCH}"
    mv dotfiles "${DEST_DIR}"
    cd "${DEST_DIR}"
    git remote set-url origin "${GH_REPO_SSH}"
    ./install.sh
    cd "$OG_PWD"
    rm -rf "$TMP_DIR"
    exit
fi

if type curl 2>/dev/null 1>/dev/null
then
    curl -L "$ZIP_URL" -o "$TMP_ZIP"
elif type wget 2>/dev/null 1>/dev/null
then
    wget "$ZIP_URL" -O "$TMP_ZIP"
else
    exit 1
fi

if type bsdtar 2>/dev/null 1>/dev/null
then
    bsdtar -xf "$TMP_ZIP"
elif type unzip 2>/dev/null 1>/dev/null
then
    unzip "$TMP_ZIP"
else
    exit 1
fi

mv "${TMP_ZIP_ROOT_DIR}" "${DEST_DIR}"
cd "${DEST_DIR}"
./install.sh
rm -rf "${TMP_DIR}"
cd "$OG_PWD"

exit

# HTML Code for browser
#--><div id="main_contents"> <!--
#-->    <a href="../">../</a> | <a href="install.sh">install.sh</a> | <a href="install.bat">install.bat</a> | <a href="https://github.com/yuk7/dotfiles">GitHub</a><br> <!--
#-->    <p>Welcome to dotfiles quick installer!</p> <!--
#--></div> <!--
#--><style> /*
#*/     body { visibility: hidden; position: relative; } /*
#*/     #main_contents { visibility: visible; position: absolute; top: 0; left:0; } /*
#*/</style> <!--
#--> <!-- Automatic download script --> <!--
#--><script>/*
#*/ document.body.innerHTML=document.getElementById("main_contents").innerHTML; /*
#*/ var ua = navigator.userAgent; /*
#*/ if (ua.includes("bot")) { /*
#*/ } else if (ua.includes("Windows")) { /*
#*/     document.body.innerHTML+="Downloading install.bat"; /*
#*/     location.href="install.bat"; /*
#*/ } else if (ua.includes("Android") || ua.includes("iPhone")) { /*
#*/ /* Do nothing */ /*
#*/ } else { /*
#*/     document.body.innerHTML+="Downloading install.sh"; /*
#*/     location.href="install.sh"; /*
#*/ } /*
#*/</script>
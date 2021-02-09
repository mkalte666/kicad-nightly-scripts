#!/bin/bash

KNS_DEFAULT_DIR="$HOME/.local/share/kicad_nightly_script/"

echo "Setting up folders"

if [ -z $KNS_INSTALL_DIR ]; then 
    echo "KNS_INSTALL_DIR not set. installing to $KNS_DEFAULT_DIR"
    KNS_INSTALL_DIR="$KNS_DEFAULT_DIR"
fi

KNS_REPOS_DIR="$KNS_INSTALL_DIR/repos"
KNS_BUILDS_DIR="$KNS_INSTALL_DIR/builds"
KNS_CMAKE_INSTALL_DIR="$KNS_INSTALL_DIR/install"
KNS_KICAD_SRC_DIR="$KNS_REPOS_DIR/kicad"
KNS_KICAD_BUILD_DIR="$KNS_BUILDS_DIR/kicad"

mkdir -p "$KNS_INSTALL_DIR"
mkdir -p "$KNS_BUILDS_DIR"
mkdir -p "$KNS_REPOS_DIR"
mkdir -p "$KNS_KICAD_BUILD_DIR"

KNS_TEMPLATE_REPO="$KNS_REPOS_DIR/kicad-templates"
KNS_TEMPLATE_BUILD="$KNS_BUILDS_DIR/kicad-templates"
mkdir -p "$KNS_TEMPLATE_BUILD"
KNS_SYMBOL_REPO="$KNS_REPOS_DIR/kicad-symbols"
KNS_SYMBOL_BUILD="$KNS_BUILDS_DIR/kicad-symbols"
mkdir -p "$KNS_SYMBOL_BUILD"
KNS_SYS3D_REPO="$KNS_REPOS_DIR/kicad-packages3D"
KNS_SYS3D_BUILD="$KNS_BUILDS_DIR/kicad-packages3D"
mkdir -p "$KNS_SYS3D_BUILD"
KNS_SYS_REPO="$KNS_REPOS_DIR/kicad-footprints"
KNS_SYS_BUILD="$KNS_BUILDS_DIR/kicad-footprints"
mkdir -p "$KNS_SYS_BUILD"

KNS_RUN_SCRIPT="$KNS_INSTALL_DIR/kns-run.bash"
KNS_KICAD_EXE="$KNS_CMAKE_INSTALL_DIR/bin/kicad"

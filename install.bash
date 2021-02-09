#!/bin/bash 

. setvars.bash

echo "Fetching repos" 

if [ -d "$KNS_KICAD_SRC_DIR" ]; then 
    cd "$KNS_KICAD_SRC_DIR"
    git pull origin master
else 
    cd "$KNS_REPOS_DIR"
    git clone --depth=1 --recursive https://gitlab.com/kicad/code/kicad.git
fi

if [ -d "$KNS_SYMBOL_REPO" ]; then
    cd "$KNS_SYMBOL_REPO"
    git pull origin master 
else  
    cd "$KNS_REPOS_DIR"
    git clone --depth=1 --recursive https://gitlab.com/kicad/libraries/kicad-symbols.git
fi

if [ -d "$KNS_SYS_REPO" ]; then 
    cd "$KNS_SYS_REPO"
    git pull origin master 
else 
    cd "$KNS_REPOS_DIR"
    git clone --depth=1 --recursive https://gitlab.com/kicad/libraries/kicad-footprints.git
fi    

if [ -d "$KNS_SYS3D_REPO" ]; then 
    cd "$KNS_SYS3D_REPO"
    git pull origin master 
else  
    cd "$KNS_REPOS_DIR"
    git clone --depth=1 --recursive https://gitlab.com/kicad/libraries/kicad-packages3D.git
fi 

if [ -d "$KNS_TEMPLATE_REPO" ]; then 
    cd "$KNS_TEMPLATE_REPO"
    git pull origin master 
else 
    cd "$KNS_REPOS_DIR"
    git clone --depth=1 --recursive https://gitlab.com/kicad/libraries/kicad-templates.git
fi 

echo "Building Kicad"

cd "$KNS_KICAD_BUILD_DIR"
cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$KNS_CMAKE_INSTALL_DIR" \
    -DKICAD_USE_OCC=On \
    -DKICAD_SCRIPTING_PYTHON3=On \
    -DKICAD_SCRIPTING_WXPYTHON_PHOENIX=On \
    "$KNS_KICAD_SRC_DIR"
ninja
ninja install

cd "$KNS_TEMPLATE_BUILD"
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$KNS_CMAKE_INSTALL_DIR" $KNS_TEMPLATE_REPO
make install

cd "$KNS_SYMBOL_BUILD"
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$KNS_CMAKE_INSTALL_DIR" $KNS_SYMBOL_REPO
make install

cd "$KNS_SYS_BUILD"
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$KNS_CMAKE_INSTALL_DIR" $KNS_SYS_REPO
make install

cd "$KNS_SYS3D_BUILD"
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="$KNS_CMAKE_INSTALL_DIR" $KNS_SYS3D_REPO
make install

if [ ! -f "$KNS_RUN_SCRIPT" ]; then
    touch "$KNS_RUN_SCRIPT"
    chmod +x "$KNS_RUN_SCRIPT"
    echo "#!/bin/bash" >> "$KNS_RUN_SCRIPT"
    echo "$KNS_KICAD_EXE" >> "$KNS_RUN_SCRIPT"
fi

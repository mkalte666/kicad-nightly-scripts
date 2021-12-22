# kicad-nightly-scripts
Scripts i use to build kicad from the top of the sources

## Usage
This will install to the default directory (which is `$HOME/.local/share/kicad_nightly_script/`)

    git clone git@github.com:mkalte666/kicad-nightly-scripts 
    cd kicad-nightly-scripts 
    ./install.bash 
 
If you want to install somewhere else, you can can set `KNS_INSTALL_DIR`

    KNS_INSTALL_DIR=/media/someOtherPlace/kicad/ ./install.bash 
  
Then you can just run it by typing 

    /your/install/dir/kns-run.bash
  
## You need 
... ninja for the build and everything kicad wants in terms of other dependencies. 
You can find out everything needed here: https://dev-docs.kicad.org/en/build/getting-started/

# CONDA PACKAGES FOR FreeCAD
The idea behind using conda for freecad is the wish for a consistend package-manager for linux (all distros), windows and mac. At the moment only linux-64 builds are available. Furthermore conda gives FreeCAD the ability to install 3rd-party modules with dependencies easily.

FreeCAD packages on conda will be available only with python3. While there is the possebility to build packages also with python2 on linux, there will be no packages uplaoded to anaconda.org which depends on python2.

For more information about conda, you can follow this link:
https://conda.io/docs/intro.html


# HOW TO INSTALL FreeCAD WITH CONDA
## INSTALL MINICONDA:

### unix
- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2 but you can have a python2 env anyway)
- install miniconda: bash <miniconda-file>.sh (not as root!!!)
- at the end of the install it will ask you if you want to add the anaconda-dir to the $PATH, say yes.
- if you do not want anaconda to be the default python open the ~/.bashrc and edit the new line:
    -from this: __export PATH="path_to_anaconda/bin:$PATH"__
    -to this: __alias initConda='export PATH="path_to_anaconda/bin:$PATH" '__
    this way conda isn't perpended by default. As soon as you call "initConda" python will be the anaconda version.

### windows
- first get miniconda: http://conda.pydata.org/miniconda.html choose python3 (it's not necessary, you could also choose python2 but you can have a python2 env anyway)
- install by double-clicking the downloaded file
- follow the instruction and install for user.

## INSTALL FREECAD

- first we have to add some channels to get all the necesarry packages:
  - you can add them one by one with: conda config --add channels <name>
  - or you can open the ~/.condarc and add them directly to this file
at the end this file have to look like this.
__open ~.condarc with a editor and make the channels section look like this__

```
channels:
  - conda-forge
  - defaults
  - freecad
```

 - the channels hosting this libraries:
    - freecad: freecad, coin, pivy, boost, occt, ...
    - conda-forge: pyside, shiboken, ...


## CREATE A NEW ENVIROMENT
### windows:
- open the anaconda prompt/terminal
- create an env: `conda create -n env-name freecad` # with <env-name> is the name of the env, eg. fc_test
    (this will install all necessary packages needed to run FreeCAD)
- `activate <env-name>`
- start FreeCAD by entering: `FreeCAD`

### unix
- type in terminal: `initConda` (now the "conda" command should be available)
- create an env: `conda create -n env-name freecad` # with <env-name> is the name of the env, eg. fc_test
    (this will install all necessary packages needed to run FreeCAD)
- at the end of this process a short statement is printed how to activate the new env.: ```source activate <env-name>```
- start FreeCAD by entering: `FreeCAD`


## use specific dependency versions
to create an enviroment with secific versions of packages you can add these packages with versions to the create command. This will give you the oppertunity to reproduce a enviroment. eg.: in case some newer dependencies are broken.

```conda create -n freecad freecad=0.17=py35_0 netgen=6.1=5 ...```


# ADDITIONAL INFORMATION

- list all enviroments
```
conda env list
```  

- update
```
conda update --all
conda update conda
```

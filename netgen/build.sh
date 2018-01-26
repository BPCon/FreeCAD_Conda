echo "-------------------CUSTOM VARIABLES-------------"
export NETGENDIR=$PREFIX/lib/netgen
echo "set NETGENDIR to: $NETGENDIR"

export PYTHONPATH=$SP_DIR
echo "set PYTHONPATH to: $PYTHONPATH"
echo "------------------------------------------------"

mkdir build -p
cd build 

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DNG_INSTALL_DIR_INCLUDE=$PREFIX/include/netgen \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -DCMAKE_CXX_FLAGS='-fabi-version=6' \
      -DOCC_LIBRARY_DIR=$PREFIX/lib \
      -DUSE_NATIVE_ARCH=OFF \
      -DUSE_OCC=ON \
      -DUSE_PYTHON=ON \
      -DUSE_GUI=OFF \
      -DUSE_SUPERBUILD=OFF \
      ..


make -j${CPU_COUNT} 2>&1 | tee output.txt
make -j${CPU_COUNT} install 
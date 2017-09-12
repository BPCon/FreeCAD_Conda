mkdir -p build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCOIN_LINK_LIBSIMAGE=ON \
      ..

make -j${CPU_COUNT} install

# Certain apps, like pivy, need coin-config. Cmake does not yet generate the coin-default.cfg
cd ..
mkdir build-cfg -p
cd build-cfg
../configure --prefix=$PREFIX --without-framework --enable-3ds-import --disable-dependency-tracking
make coin-default.cfg

mkdir $PREFIX/share/Coin/conf -p
cp coin-default.cfg $PREFIX/share/Coin/conf/
cp ${SRC_DIR}/bin/coin-config ${PREFIX}/bin/
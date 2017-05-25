mkdir $PREFIX/lib/freecad -p

mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DNETGENDATA=$PREFIX/include/netgen \
      -DNETGEN_INCLUDEDIR=$PREFIX/include/netgen \
      -DNGLIB_INCLUDE_DIR=$PREFIX/include/netgen/nglib \
      -DOCC_INCLUDE_DIR=$PREFIX/include/opencascade \
      -DOCC_LIBRARY_DIR=$PREFIX/lib \
      -DOCC_LIBRARIES=$PREFIX/lib CACHE PATH \
      -DFREECAD_USE_OCC_VARIANT="Official Version" \
      -DOCC_OCAF_LIBRARIES=$PREFIX/lib CACHE PATH \
      -DSWIG_DIR=$PREFIX/share/swig/3.0.8 \
      -DSWIG_EXECUTABLE=$PREFIX/bin/swig \
      -DPYTHON_EXECUTABLE=$PYTHON \
      -DBUILD_FEM_NETGEN=YES \
      ..

make -j4 2>&1 | tee output.txt
make install
# mkdir $PREFIX/bin -p
# ln -s ../lib/freecad/bin/FreeCAD $PREFIX/bin/freecad
# ln -s ../lib/freecad/bin/FreeCADCmd $PREFIX/bin/FreeCADCmd
rm ${PREFIX}/doc -r     # smaller size of package!

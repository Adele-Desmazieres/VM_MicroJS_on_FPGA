#! /bin/bash 

cd Eclat/vm
make clean

cd ../target
make clean

cd ../eclat-compiler
make clean

cd ../../MicroJS
make clean

cd ../NativeVM
make clean

cd ..

rm Eclat/target/tb_main

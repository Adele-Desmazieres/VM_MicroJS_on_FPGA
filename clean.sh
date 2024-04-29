#! /bin/bash 

cd Eclat
make clean
cd target
make clean
cd ../../MicroJS
make clean
cd ../NativeVM
make clean
cd ..

rm Eclat/target/tb_main
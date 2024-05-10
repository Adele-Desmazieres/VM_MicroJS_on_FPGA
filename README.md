# MicroJS sur FPGA

10/05/2024

## Auteurs

- Adèle DESMAZIERES
- Said ZUHAIR

## Lancement

Le dossier MicroJS contient un compilateur MicroJS reciblé pour embarquer du bytecode dans un tableau Eclat. Lancer l'outil MicroJS pour compiler le code d'un test en bytecode :

```sh
cd MicroJS
make
./microjs tests/inc.js -compile
./microjs tests/inc.js -eclat
```

Le dossier Eclat contient un sous-dossier eclat-compiler (compilateur Eclat) ainsi qu’un sous-dossier vm (squelette d’implémentation de la machine VM3I018). Lancer l'outil Eclat pour tester la VM :

```sh
cd ../Eclat/eclat-compiler
make
cd ../vm
make DEBUG=true
make simul NS=30000 # NS est le nombre de nanosecondes
```


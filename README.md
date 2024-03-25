
Le dossier MicroJS contient un compilateur MicroJS reciblé pour embarquer du bytecode dans un tableau Eclat. Lancer l'outil MicroJS :

```sh
cd MicroJS
make
./microjs tests/inc.js -compile
./microjs tests/inc.js -eclat
```

Le dossier Eclat contient un sous-dossier eclat-compiler (compilateur Eclat) ainsi qu’un sous-dossier vm (squelette d’implémentation de la machine VM3I018). Lancer l'outil Eclat :

```sh
cd ../Eclat/eclat-compiler
make
cd ../vm
make DEBUG=true
make simul NS=4000 # NS est le nombre de nanosecondes
```


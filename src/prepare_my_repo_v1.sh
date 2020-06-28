#!/bin/bash

#create the repo gives access rights and clone 
blih -u mathieu.cherpitel@epitech.eu repository create $1
blih -u mathieu.cherpitel@epitech.eu repository setacl $1 ramassage-tek r
blih -u mathieu.cherpitel@epitech.eu repository getacl $1
git clone git@git.epitech.eu:/mathieu.cherpitel@epitech.eu/$1

echo repository created and cloned

##moove the lib to the repo (the folder my_lib has to be up to date)
cp -r my_lib/include $1
cp -r my_lib/lib $1
cp my_lib/Makefile $1

echo lib copied

##goes in the repo
cd $1

##create a gitignote file *.o *.c *~ #* *.sh *a.out
touch .gitignore
echo "main*" >> gitignore
echo "*.o" >> .gitignore
echo "*.a" >> .gitignore
echo "#." >> .gitignore
echo "*.sh" >> .gitignore
echo "a.out" >> .gitignore

echo gitignore created

##create a scrit that can build a main.c
touch build_main.sh
chmod 755 build_main.sh
echo "#!/bin/bash" >> build_main.sh

echo touch main.c >> build_main.sh
echo echo "/*\n** EPITECH PROJECT, 2019\n** emacs\n** File description:\n TO DO\n*/" >> build_main.sh
echo echo "int main(int argc, char ** argv)" >> build_main.sh
echo echo "{\nreturn(0);\n}" >> build_main.sh

echo build_main script created

##create a script that can remove the repo
touch remove_repo.sh
chmod 755 remove_repo.sh
echo "#!/bin/bash" >> remove_repo.sh
echo "blih -u mathieu.cherpitel@epitech.eu repository delete $1" >> remove_repo.sh

echo remove_repo script created

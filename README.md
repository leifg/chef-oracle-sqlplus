# Description

This recipe installs the oracle client (sqlplus) on your Ubuntu machine.

## Prequisits

As it is not possible to automatically download the binary for the Oracle client (Oracle expects you to have an account in order to download the files) you need to add the .rpm file to /mnt/share before you run the recipe.

Alternatively you can specifiy another path (or filename) in the attributes.

## Recipes

### default

(Currently) the only recipe to install the Oracle client.
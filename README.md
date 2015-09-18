# .files

## Why?
Before few days I have no idea about managing dot files. In most cases I search and used predefined vim, zsh and other configuration files and try to adjust to them, but one day after reading how these files can be managed with help of some version control system, I decide to try to create my own one, matching my style.

PS. Until yesterday I hated missing of all kinds of aliases and commands shortcuts. But from today new beginning is coming - to create my personal ultimate configuration!

First, backup. And second - easy manage under version control of all .files with all custom configurations plus some scripts for easy setup new environment.

## How to use it?
Just clone and run ```install``` to link all configuration files.

But before that, maybe would be best to run all shell scripts to install and setup all necessary and unnecessary utilities and programs:

```shell
$ ./brew.sh
$ ./atom.sh
$ ./osx.sh
```

### brew.sh

Make sure you run this first, or before `atom.sh` because it atom is missing brew will install it :)

### atom.sh

### osx.sh

## Thanks to...

- [kunev](https://github.com/kunev) - for awesome aliases and separated zsh files structure
- [anishathalye](https://github.com/anishathalye) - for Dotbot and cool post
inspirational post about dot files
- [daviesjamie](https://github.com/daviesjamie) - without you I would't know about Fish shell.

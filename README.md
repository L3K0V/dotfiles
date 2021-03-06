# Configuration and Setup Swissknife

## Getting started

Clone this repository

```bash
$ git clone https://github.com/L3K0V/dotfiles.git
```

### Initial setup

Before setup the dotfiles maybe would be good to setup the environment.

Go to `scripts` folder

```bash
$ cd scripts
```

First execute `brew.sh`. This will take a while...

```bash
$ ./brews.sh
```

Then install global npm packages

```bash
$ ./npm.sh
```

and atom packages

```bash
$ ./atom.sh
```

#### Setup GPG using keybase

https://github.com/pstadler/keybase-gpg-github

```bash
$ killall gpg-agent && gpg-agent --daemon --pinentry-program /usr/local/bin/pinentry
$ echo "test" | gpg --clearsign
```

### Install

From the root of the cloned folder install and link all configurations

```bash
$ ./install
```

## Post-setup

### Setup Machine learning environment

Following http://fmi.machine-learning.bg/lectures/01-intro

```bash
$ mkvirvtualenv ml
$ workon ml
$ pip install numpy scipy matplotlib ipython scikit-learn pandas pillow mglearn jupyter
```

After that start the environment:

```bash
$ jupyter notebook
```

And remember these important megical initialization lines:

```python
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import mglearn
from IPython.display import display

%matplotlib notebook
```

https://github.com/jf/rbenv-gemset#usage

```
$ antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
```

### AdGuard

#### Filters

- https://oisd.nl/
- https://hblock.molinero.dev

## Xcode CLI tools

Reinstall them using:

```
$ sudo rm -rf /Library/Developer/CommandLineTools
$ sudo xcode-select --install
```

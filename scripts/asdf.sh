asdf plugin-add nodejs

bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

asdf install nodejs 14.15.4
asdf global nodejs 14.15.4

asdf plugin-add ruby
asdf install ruby 2.7.2
asdf global ruby 2.7.2

asdf plugin-add flutter
asdf install flutter 1.22.5
asdf global flutter 1.22.5

asdf plugin-add python
asdf install python 3.9.1
asdf global python 3.9.1
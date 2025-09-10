# Desktop and notebook settings

## Install vim

Install the plugins. See the `VimAndPlugins.md` for details.

## Setup Git and GitHub

- Install git auto-complete, and check the `.zshrc` for settings.

```
curl -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
```

- Create SSH key pairs.
  - Execute `ssh-keygen -t rsa -b 4096 -C <Email>` to generate the key pair files.
  - start the ssh agent in the background `ssh-agent -s`.
  - Add to the key chain: `ssh-add -K ~/.ssh/id_rsa`

- Add keys to Github account
  - Check the `.ssh/config` or copy the settings.
  - `cat more ~/.ssh/id_rsa.pub | pbcopy`
  - GitHub -> Settings -> SSH and PGP keys -> add the key here

- Configure the git, such as:

```
git config --global user.name "<Display Name>"
git config --global user.email <Email>
```

## Install Go and GVM

- install gvm: the command below will detect the `zsh`, install the gvm, and update the `.zshrc` to source the `.gvm/scripts/gvm`. (note: you might run into error if replacing `bash` with `zsh`.)

```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

- inital setup: the following setup is required, so that you don't see the error `Invalid or corrupt Go version`.

```shell
# install the first version with `-B` (binary-only)
gvm install go1.25.1 -B

# install and compile the second version without `-B`
gvm install go1.24.7

# set the default version
gvm use go1.25.1 --default
```

- check if there is any error with a new zsh shell.

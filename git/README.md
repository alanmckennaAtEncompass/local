## Git

Git is setup only in WSL, and uses protected ed25519 keys that are used to auth against GitHub and Gitlab. The following code was added to `~/.bashrc` to run at startup of WSL, to setup ssh agent for Git to obtain key passphrase.

```bash
# in ~/.bashrc

# ssh agent is setup for Git to obtain key passphrase
env=~/.ssh/agent.env

agent_load_env () {
    test -f "$env" && . "$env" >| /dev/null ;
}

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ;
}

agent_load_env
# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi
unset env
```

Commit signing via GPG has also been enabled globally, for this we need to add the following to `~/.bashrc`.

```bash
# in ~/.bashrc

# required to enable gpg Git commit signing
export GPG_TTY=$(tty)
```

```bash
# generates gpg key
$ gpg --full-generate-key
# shows all available keys
$ gpg --list-secret-keys --keyid-format=long

$ git config --global -l
user.name=<USERNAME>
user.email=<EMAIL>
user.signingkey=<KEY_ID>
core.editor=vim
init.defaultbranch=main
commit.gpgsign=true
```

To read the public gpg (maybe required to give to other clients) use the following command. It will output it to ~/.ssh/public.pgp.

```bash
$ gpg --output ~/.ssh/public.pgp --armor --export <EMAIL>
```
### Show Git Branch on CMD Line

To add the current local Git branch to the cmd line, update `~/.bashrc` following the below steps

**Find and remove the following lines in your `~/.bashrc`**
```bash
$ vim ~/.bashrc
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```

**Using the below commands, update and reload your `~/.bashrc`**

```bash
$ echo "

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

" >> ~/.bashrc
$ source ~/.bashrc
```

### .gitconfig

```bash
$ echo "
[user]
        name = <NAME>
        email = <EMAIL>
        signingkey = <SIGNING_KEY>
[core]
        editor = vim
[init]
        defaultBranch = main
[commit]
        gpgsign = true
  template = ~/git/.commitTemplate
[alias]
  lg = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
" > ~/.gitconfig
```

### Git Stash

Use git stash to save un-staged or committed changes to allow to use them later on with `pop` without messing up your git tree

```
$ git stash
$ git stash list
$ git stash pop
```

#### Exclude Custom Files (without .gitignore)

Sometimes we will have files that we don't want to check into Git. For that we usually use `.gitignore`. However, this is more for common files in the source code that do not change and that everyone will generate/have e.g. `node_modules`.

For cases where we want to ignore personal, unique or custom files we should use `.git/info/exclude` e.g. `.vscode` if you're the only one using VSCode.
```


### GitLab

- Our Docker image registry is hosted in GitLab, which requires an access token in order to authenticate and use. See [GitLab docs](https://docs.gitlab.com/ee/user/packages/container_registry/) for more detail.

- Encompass Personal Access Token with API scope should be generated and is stored in WSL `~/gitlab/encompass-personal-access-token`
  - Use the following command to test gitlab access and Docker registry are configured correctly
  - Once we have authenticated with the *`GITLAB_PERSONAL_ACCESS_TOKEN`* then we shouldn't need to use it again. It should automatically authenticate without user input.

```bash
# read Gitlab personal access token
$ cat gitlab/encompass-personal-access-token
# pwd = encompass project root
$ bash ./docker-files/setup.sh
...
Username: firsName.secondName
Password: <GITLAB_PERSONAL_ACCESS_TOKEN>
```

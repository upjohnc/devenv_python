# Nix Shell + Python using Devenv

This repo is a first stab at using devenv to set up a standard local environment with
nix shell.


## Install

- devenv install: https://devenv.sh/getting-started/
    - install nix
    - install devenv

## Devenv Shell

devenv sets up a .envrc to run each time you enter the root directory.
This runs `devenv shell` and part of dropping into the shell is it
runs the enter commands.  For this repo the `poetry install --sync`
command is run, which ensures that the poetry virtualenv is installed
with the dev environment.

You could remove that part from the .envrc and run `devenv shell` directly.
It seems that calling the command directly drops you into a subshell
which is in bash (at least for me) rather than zsh.  You can run
zsh as the shell interpreter after the devenv shell is set up.

## Local Set Up

direnv will drop you into the devenv shell and also do the poetry install.
You then can run python scripts with `poetry run python <>`.  For instance,
`poetry run src/my_file.py .`.  If you don't want to add `poetry run` to your
commands, you can enter the virtual env with `poetry shell`.

## Unit Tests

devenv creates a shell scripts and one is for unit tests.
You can run `unit_tests` and it will run the pytest command.

## Good & Bad

benefit
- direnv does the heavy lifting by setting the devenv shell
    - each time the root dir is entered the poetry virtual env is synced with the lock file
      which ensures the right packages locally each time
- devenv scripts used as standard actions.  This is similar to a makefile

negative
- direnv runs the devenv enter which means that poetry sync will run

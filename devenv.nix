{ pkgs, lib, config, inputs, ... }:

{
  languages.python.enable = true;
  languages.python.version = "3.12";

  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  # packages = [ pkgs.git ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  scripts.poetry_dev.exec = ''
      pip install -U pip
      pip install poetry
      poetry install --with dev --sync --no-root
    '';

  scripts.unit_tests.exec = ''
      poetry run pytest -vv ./src/my_file.py
  '';

  enterShell = ''
    hello
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests to confirm environment"
    python --version | grep 3.12
  '';

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}

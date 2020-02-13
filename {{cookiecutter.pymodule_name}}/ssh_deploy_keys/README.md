If you asked cookiecutter to create an SSH deploy key pair for your project,
the corresonding files will be placed in this directory. You should manually
upload these keys to GitHub and CircleCI.

*Important:* The files in this directory should _never_ be put under version control.

After you have created the GitHub repository for your project and enabled builds for it on CircleCI:

1) Add the _private_ key to CircleCI here: https://circleci.com/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.github_project_name }}/edit#ssh

*Note:* In the input box, make sure you specify `github.com` as the Hostname.

2) Add the _public_ key to GitHub here: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.github_project_name }}/settings/keys

*Note:* Make sure you enable the checkbox "Allow write access".

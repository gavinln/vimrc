# direnv tips

[direnv][100] is a Go program that updates your environment when you change
directories. It uses a `.direnv` file to setup the environment.

Example direnv file that shows how to

* export a variable WS_ROOT
* setup a pipenv environment
* add a directory to the path
* display a message to the user

## Example .direnv file

```
export WS_ROOT=/home/ubuntu/data/notebooks/GNoronha/creative-testing
layout pipenv
echo "command scripts: $(ls -C ./scripts)"
PATH_add ./scripts
echo "git extras: contrib summary effort commits-since count info standup root"
```

## Links

Add links here


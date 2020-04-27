# CLI tips

Tips on using the command line

## fd

List all (including hidden) directories 2 levels deep named .git

```
fd -t d -H -d 2 .git
```

## git

Get the status of all git directories

```
ls -d */ | xargs -I{} git -C '{}' status
```

brvy.space
===

Content behind my personal site.

Run after cloning:

```
git submodule update --init --recursive
```

Deploy with rsync:

```
USER=<SSH user>
HOST=<SSH host>
DIR=<Directory to deploy to>

rsync -avz --delete public/ ${USER}@${HOST}:${DIR}
```

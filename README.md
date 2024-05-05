# Tools

Ever wanted to generate a qrcode or you want audio from youtube and you end up on a website with useless buttons?
What if their is a simple alternative for the command line.

## Usage

Enable [nix flakes](https://nixos.wiki/wiki/Flakes).

### audio-from-yt

```shell
nix run github:sempruijs/tools#audio-from-yt
```

### qrcode

```shell
nix run github:sempruijs/tools#hello
```

### to-chords

Generate a pdf with large chords from markdown for people with a visual impairment.

```shell
nix run github:sempruijs/tools#to-chords
```

### update-deps-pr

Update nix flake lock file and open a pull request on github.
This is copied from [github:cor/update-deps-pr](https://github.com/cor/update-deps-pr).

```shell
nix run github:sempruijs/tools#update-deps-pr
```

## Forking

Feel free to fork this repository and add your own tools.
I've added a simple ```hello.nix``` example.

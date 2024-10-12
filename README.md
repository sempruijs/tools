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

Generate a qrcode

```shell
nix run github:sempruijs/tools#qrcode
```

### pdf-from-musescore

Download a pdf from musescore.

```shell
nix run github:sempruijs/tools#pdf-from-musescore
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

### yes-or-no

Simple yes-or-no cli for making scripts.
A question string should be given:

```shell
nix run github:sempruijs/tools#yes-or-no -- "Does it work?"
```

### ocr-pdf

If you want to make pdf accessible for screenreaders or you just want to select some text in a pdf, you can do so by running:

```shell
nix run github:sempruijs/ocr-pdf
```

## Forking

Feel free to fork this repository and add your own tools.
I've added a simple ```hello.nix``` example.

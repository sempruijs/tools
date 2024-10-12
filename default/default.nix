pkgs: pkgs.writeShellApplication {
  name = "tools menu";
  runtimeInputs = with pkgs; [];
  text = ''
    printf "Welcome! \n"
    printf "Reproducable tools by Sem Pruijs\n"
    printf "You can read the source code on https://github.com/sempruijs/tools\n\n"

    printf "The following tools are available:\n"
    printf " - audio-from-yt\n"
    printf " - to-chords\n"
    printf " - qrcode\n"
    printf " - ocr-pdf\n"
    printf " - pdf-from-musescore\n"
    printf "\n"

    printf "enter the name of the tool: "
    read -r tool

    nix run github:sempruijs/tools#"$tool"
  '';
}



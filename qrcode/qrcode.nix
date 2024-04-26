pkgs: pkgs.writeShellApplication {
  name = "qrcode";
  runtimeInputs = with pkgs; [ qrencode ];
  text = ''
    printf "\n----- step 1 of 2 -----\n\n"
    printf "enter url: "
    read -r text

    printf "\n----- step 2 of 2 -----\n\n"
    printf "output file name: "
    read -r name

    qrencode -i "$text" -o "$name"
  '';
}



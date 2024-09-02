# pkgs: pkgs.writeShellApplication {
pkgs: pkgs.writeShellApplication {
  name = "ocr-pdf";
  runtimeInputs = with pkgs; [ python312Packages.ocrmypdf ];
  text = ''
    printf "\n----- step 1 of 2 -----\n\n"
    printf "enter pdf name: "
    read -r name

    printf "\n----- step 2 of 2 -----\n\n"
    printf "enter pdf name for generated pdf: "
    read -r newname

    ocrmypdf "$name" "$newname"
  '';
}


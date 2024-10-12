pkgs: pkgs.writeShellApplication {
  name = "hello";
  runtimeInputs = with pkgs; [ dl-librescore ];
  text = ''
    printf "\n----- step 1 of 1 -----\n\n"
    printf "enter the url: "
    read -r url
    
    dl-librescore -i "$url" -t pdf
  '';
}

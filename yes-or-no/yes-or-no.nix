pkgs: pkgs.writeShellApplication {
  name = "yes-or-no";
  runtimeInputs = with pkgs; [ ];
  text = ''
    while true; do
      read -r -p "$* [y/n]: " yn
      case $yn in
          [Yy]*) exit 0;;  
          [Nn]*) echo "Aborted" ; exit 1 ;;
      esac
    done
  '';
}

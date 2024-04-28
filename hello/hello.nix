pkgs: pkgs.writeShellApplication {
  name = "hello";
  runtimeInputs = with pkgs; [ ponysay ];
  text = ''
    ponysay "hello"
  '';
}

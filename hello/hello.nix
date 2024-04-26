pkgs: pkgs.writeShellApplication {
  name = "audio-from-yt";
  runtimeInputs = with pkgs; [ ponysay ];
  text = ''
    ponysay "hello"
  '';
}

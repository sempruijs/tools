pkgs: pkgs.writeShellApplication {
  name = "audio-from-yt";
  runtimeInputs = with pkgs; [ yt-dlp ffmpeg_6 ];
  text = ''
    printf "hello"
  '';
}

# pkgs: pkgs.writeShellApplication {
pkgs: pkgs.writeShellApplication {
  name = "audio-from-yt";
  runtimeInputs = with pkgs; [ yt-dlp ffmpeg_6 ];
  text = ''
    printf "\n----- step 1 of 2 -----\n\n"
    printf "enter the url: "
    read -r url

    printf "\n----- step 2 of 2 -----\n\n"
    printf "Please type one of the following output formats:\n\n"
    printf " - aac\n"
    printf " - alac\n"
    printf " - flac\n"
    printf " - m4a\n"
    printf " - mp3\n"
    printf " - vorbis\n"
    printf " - wav\n\n"

    printf "format: "
    read -r format

    yt-dlp -x --audio-format "$format" "$url"
  '';
}


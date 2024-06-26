pkgs: pkgs.writeShellApplication {
  name = "to-chords";
  runtimeInputs = with pkgs; [ pandoc texliveConTeXt ];
  text = ''
    printf "\n-------- files --------\n\n"
    ls
    
    printf "\n----- step 1 of 2 -----\n\n"
    printf "enter the file name (.md): "
    read -r input_name

    printf "\n----- step 2 of 2 -----\n\n"
    printf "enter the output file name (.pdf): "
    read -r output_name

    pandoc "$input_name" \
    --pdf-engine context \
    -V fontsize=80pt \
    -V header-text="hello" \
    -o "$output_name"
  '';
}


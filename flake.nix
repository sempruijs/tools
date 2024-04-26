{
  description = "tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  # pass inputs to output function
  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
        in {
          packages = {
            default = import ./default/default.nix pkgs;
            audio-from-yt = import ./audio-from-yt/audio-from-yt.nix pkgs;
            hello = import ./hello/hello.nix pkgs;
            qrcode = import ./qrcode/qrcode.nix pkgs;
          };
          devShells = {
            default = pkgs.mkShell {
              buildInputs = with pkgs; [ yt-dlp ffmpeg_6 qrencode ];
            };
          };
        };
    };
}

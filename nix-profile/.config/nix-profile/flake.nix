{
  description = "Main apps";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "desktop";
      paths = with pkgs; [
        neovim
        git
        tmux
        htop
        ripgrep
        fzf
        yazi
        _7zz
        jq
        poppler
        fd
        zoxide
        resvg
        imagemagick
        ffmpeg
    	nb
      ];
    };
  };
}

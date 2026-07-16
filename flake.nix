{
  description = "Pacotes padrão de desenvolvimento";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "profile";
      paths = with pkgs; [
        neovim
        nodejs_26
        pnpm
        tree-sitter
        tmux
        ripgrep
        fzf
        fd
        nb
        stow
        w3m
        gcc
        jdk25
      ];
    };
  };
}

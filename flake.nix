{
  description = "Devshell for evdev";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      ghcVersion = "ghc96";
      pkgs = nixpkgs.legacyPackages.${system};
      hsPkgs = pkgs.haskell.packages.${ghcVersion};
      hsCompiler = pkgs.haskell.compiler.${ghcVersion};
    in {
      devShell = nixpkgs.legacyPackages.${system}.mkShell {
        nativeBuildInputs = with hsPkgs; [
          haskell-language-server
          cabal-install
          hsCompiler
        ];
      };
    });
}
{
  description = "A flake for Elixir development version";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.aarch64-darwin.default =
      with import nixpkgs { system = "aarch64-darwin"; };
      stdenv.mkDerivation {
        name = "elixir-dev";
        src = pkgs.fetchFromGitHub {
          owner = "elixir-lang";
          repo = "elixir";
          rev = "main"; 
          sha256 = "sha256-TPd/SbUQo4Hcwza/Knw1ctdfvsFg2RwwtJ5xhxde3cI=";
        };
          buildInputs = [
            pkgs.erlang 
        ];
        buildPhase = ''
        make PREFIX=$out
        '';
        installPhase = ''
        make install PREFIX=$out
        '';
      
      };

  };
}


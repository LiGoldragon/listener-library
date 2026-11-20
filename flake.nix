{
  description = "Generated Listener contracts on the shared build base";
  inputs.base.url = "github:LiGoldragon/build-base";
  outputs = { self, base }: base.lib.workspaceOutputs {
    cargoNix = ./Cargo.nix;
    memberChecks = { check, ... }: { listener-library = check "listener-library" [ "datom" ]; };
    extraChecks = { pkgs, toolchain, ... }: {
      fmt = pkgs.runCommand "listener-library-format" { nativeBuildInputs = [ toolchain ]; } ''
        rustfmt --edition 2024 --check ${./src}/lib.rs ${./build.rs}
        touch $out
      '';
    };
  };
}

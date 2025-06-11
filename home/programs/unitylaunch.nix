{ pkgs }:

pkgs.writeShellScriptBin "unitylaunch"''
    export PATH="${pkgs.vscodium}/bin:${pkgs.unityhub}/bin:$PATH"
    unityhub "$@"
''
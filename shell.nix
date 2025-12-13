{ pkgs ? import <nixpkgs> {} }:

pkgs.clangStdenv.mkDerivation {
  name = "clang-dev-shell";

  buildInputs = with pkgs; [
    cmake
    gdb
    zlib
    glm
    sqlite
    freetype
    glfw
    mesa
    vulkan-loader
    vulkan-headers
    zig
    gcc
  ];

  shellHook = ''
    echo "Entering Vulkan/Zig development shell."
    export VULKAN_SDK="${pkgs.vulkan-loader}"
    '';
}

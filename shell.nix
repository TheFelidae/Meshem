{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell rec {
    nativeBuildInputs = with pkgs.buildPackages; [ rustc cargo pkg-config 
      udev
      alsa-lib vulkan-loader
      xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
      libxkbcommon wayland # To use the wayland feature
    ];
    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath nativeBuildInputs}";
}

# Create local repo

flatpak --user remote-add --no-gpg-verify --if-not-exists winepak-local winepak-repo

# Build Sdk and Platform

flatpak-builder --arch=i386 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-wine-3.21-tkg-i386 winepak-sdk-images/wine/3.21-tkg/org.winepak.Platform.Wine.yml
flatpak-builder --arch=x86_64 --ccache --keep-build-dirs --force-clean --repo=winepak-repo builds/winepak-sdk-images-wine-3.21-tkg-x86_64 winepak-sdk-images/wine/3.21-tkg/org.winepak.Platform.Wine.yml

# Building WoW64

flatpak build-commit-from --verbose --src-ref=runtime/org.winepak.Platform.Wine/i386/3.21-tkg winepak-repo runtime/org.winepak.Platform.Wine.Compat32/x86_64/3.21-tkg

# Install

flatpak --user install winepak-local org.winepak.Platform.Wine/i386/3.21-tkg -y
flatpak --user install winepak-local org.winepak.Platform.Wine/x86_64/3.21-tkg -y
flatpak --user install winepak-local org.winepak.Platform.Wine.Compat32/x86_64/3.21-tkg -y
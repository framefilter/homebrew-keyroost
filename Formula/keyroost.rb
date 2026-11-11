# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.16.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.16.0/keyroost-v0.16.0-macos-universal2.tar.gz"
    sha256 "2aa4d05d7099ed4c2b5582d01eb15696590ea1bd5c23699f6bd6a1cd61c57fde"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.16.0/keyroost-v0.16.0-linux-x86_64.tar.gz"
    sha256 "403534f4c14640418e18615126a260b42bee17fccdf5211f6634930dc15313f4"
    depends_on "pcsc-lite"
  end

  def install
    bin.install "keyroostctl"
    bin.install "keyroost"
    # zsh only works when sourced from ~/.zshrc (see the README), not autoloaded.
    generate_completions_from_executable(bin/"keyroostctl", "completions", shells: [:bash, :fish])
    system bin/"keyroostctl", "manpage", buildpath/"man"
    man1.install Dir[buildpath/"man/*.1"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keyroostctl --version")
    assert_match "keyroostctl", shell_output("#{bin}/keyroostctl completions bash")
  end
end

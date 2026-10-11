# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.13.0/keyroost-v0.13.0-macos-universal2.tar.gz"
    sha256 "a19070ed7fdde8940ef11d398806120e989dad7de71aef6c9bac3502d360a541"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.13.0/keyroost-v0.13.0-linux-x86_64.tar.gz"
    sha256 "89f4e0e564bafd4567b73ca2df4ff0ae0989e2082a8a98f0b094276ca2e08056"
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

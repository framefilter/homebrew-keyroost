# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.14.0/keyroost-v0.14.0-macos-universal2.tar.gz"
    sha256 "a75e96a06f9217be0225cf82a24cb6c2ece5caf89be5c9b4af47f60cc97be4c2"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.14.0/keyroost-v0.14.0-linux-x86_64.tar.gz"
    sha256 "2a93c19b6b3b1fc47b89c5d5a7fd79e4c448907753972fca273757820d40d6a9"
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

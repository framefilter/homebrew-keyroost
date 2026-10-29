# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.15.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.15.0/keyroost-v0.15.0-macos-universal2.tar.gz"
    sha256 "0782e708807bb2735349029408796596a880930ee7af34ad0273ac809aa9c963"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.15.0/keyroost-v0.15.0-linux-x86_64.tar.gz"
    sha256 "c2fb7c7c4bfd1fc6c7cddfe474f25c13d7d6f83535ae0af25147470589c0738e"
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

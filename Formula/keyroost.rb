# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.8"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.8/keyroost-v0.7.8-macos-universal2.tar.gz"
    sha256 "11407fa0d033436acaa3656b07ba8f58667d44e17cf1da7ef4aba77f99bbca81"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.8/keyroost-v0.7.8-linux-x86_64.tar.gz"
    sha256 "033e7378be357d49de0bcc1399761909fda1345a7f15877a5c0f2a4499d8e86c"
    depends_on "pcsc-lite"
  end

  def install
    bin.install "keyroostctl"
    bin.install "keyroost"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keyroostctl --version")
  end
end

# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.7/keyroost-v0.7.7-macos-universal2.tar.gz"
    sha256 "cafb8803e3078d0845d2370384aeb370f4fe51b7ec94abcbe339bca7dfc14ed1"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.7/keyroost-v0.7.7-linux-x86_64.tar.gz"
    sha256 "eea2f0b4351d80c38ba212e160e543d7ee443354e0cf7ba360ce522bb06e176d"
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

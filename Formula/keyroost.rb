# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.0/keyroost-v0.7.0-macos-universal2.tar.gz"
    sha256 "2c6f9bdc4e41fb69656a053b0c18c9dc6ddf11820f93efb77b690ce778761fdf"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.0/keyroost-v0.7.0-linux-x86_64.tar.gz"
    sha256 "779443afa0ffe08150807d4bf89dc3065015f1d81bda50f669f43e4145280c37"
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

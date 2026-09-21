# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.10.0/keyroost-v0.10.0-macos-universal2.tar.gz"
    sha256 "71036517ba8322836223c4b93bf388ac1702b86dd2392505c7fa763c9cfdc762"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.10.0/keyroost-v0.10.0-linux-x86_64.tar.gz"
    sha256 "358e52a9b25934bcb85cac00772a09d0ce5da57b6d9e2779af802d84ce05ea70"
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

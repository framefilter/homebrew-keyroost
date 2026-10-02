# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.11.0/keyroost-v0.11.0-macos-universal2.tar.gz"
    sha256 "45d713272341485c31ced349e0ce88576558720b420d33fb976a7d9982a5e994"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.11.0/keyroost-v0.11.0-linux-x86_64.tar.gz"
    sha256 "573c80c2f4fff01decf830312e018c345df1be5246440ac1198ac7453001f0ee"
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

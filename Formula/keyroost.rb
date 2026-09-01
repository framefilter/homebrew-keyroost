# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.9.0/keyroost-v0.9.0-macos-universal2.tar.gz"
    sha256 "b2f654729868145b07857f0317bc1817efa9723fa811aa3fbf1129ea7897d7e0"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.9.0/keyroost-v0.9.0-linux-x86_64.tar.gz"
    sha256 "5088e88e0b577dce66d3bd0a5c3c0a4b8ee4dabf95e7442a41c9f25f01b5095c"
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

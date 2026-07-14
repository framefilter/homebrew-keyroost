# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.5/keyroost-v0.7.5-macos-universal2.tar.gz"
    sha256 "e596f65c393dafc2486a8a95eef456e50fa691d93af19af67d1ba3f201b77a8e"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.5/keyroost-v0.7.5-linux-x86_64.tar.gz"
    sha256 "ddf0b7c4629afb559eec0c49f5ba0cf154c02e602fd49f714bcb248d91d83e82"
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

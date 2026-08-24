# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.8.0/keyroost-v0.8.0-macos-universal2.tar.gz"
    sha256 "7962bf9408a1d1ce202041284789e51fe3a7c1a326877f70e7bf13eccbcc57c3"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.8.0/keyroost-v0.8.0-linux-x86_64.tar.gz"
    sha256 "6367c4186654bcd43b2be4028a2ec01db5dbb1317058c652be74df127d79f249"
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

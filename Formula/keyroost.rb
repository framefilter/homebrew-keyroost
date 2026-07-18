# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.6/keyroost-v0.7.6-macos-universal2.tar.gz"
    sha256 "fca64c9ed0b47cfa344c067ec1ba7af66c1a95a194784222b194672c223267f2"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.6/keyroost-v0.7.6-linux-x86_64.tar.gz"
    sha256 "b72a86f7c28d2db97735e5bab08ede62ac34d5d18ab5093c8088b923af0f9154"
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

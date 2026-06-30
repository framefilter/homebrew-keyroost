# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.3/keyroost-v0.7.3-macos-universal2.tar.gz"
    sha256 "5e87be0176e95b8af31c836263a28434b3aeca3239fdf604a95d4a72505ee1b1"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.3/keyroost-v0.7.3-linux-x86_64.tar.gz"
    sha256 "d3a089aa1353a4aff09cf3ebe1e72b58476f9fb26665633ba9e7ef94dc2f0d9c"
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

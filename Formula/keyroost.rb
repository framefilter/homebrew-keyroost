# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.1/keyroost-v0.7.1-macos-universal2.tar.gz"
    sha256 "0a9ee3d022c5eed3f564227d9cea6b508547ea961a2dd5a45961ca6e9afaa9d5"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.1/keyroost-v0.7.1-linux-x86_64.tar.gz"
    sha256 "bf921d66e1fa09ac144bf6915380c9adbe9ce4ad06611e79b5507070ffc51b05"
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

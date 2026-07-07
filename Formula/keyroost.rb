# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.4/keyroost-v0.7.4-macos-universal2.tar.gz"
    sha256 "210077a09c6517a607970dae27ca9124e163c81dff31fb36ad452cc6c0198e6f"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.4/keyroost-v0.7.4-linux-x86_64.tar.gz"
    sha256 "b7c6c6b4f640664430c95ddaee6dabe8e661cd1116f0c69ccef69a6718ff841f"
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

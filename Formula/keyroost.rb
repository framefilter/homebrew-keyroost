# Rendered and pushed to the framefilter/homebrew-keyroost tap automatically
# by .github/workflows/publish.yml. Install with:
#   brew tap framefilter/keyroost && brew install keyroost
class Keyroost < Formula
  desc "Program Token2 Molto2 TOTP tokens and manage FIDO2/OATH/OpenPGP/PIV security keys"
  homepage "https://github.com/framefilter/keyroost"
  version "0.7.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.2/keyroost-v0.7.2-macos-universal2.tar.gz"
    sha256 "f86e48ddbc8413d680a3d35a5212dba940c5785543d16e3623b577a46d7097c8"
  end

  on_linux do
    url "https://github.com/framefilter/keyroost/releases/download/v0.7.2/keyroost-v0.7.2-linux-x86_64.tar.gz"
    sha256 "3633c7b433041dddd57a9bafb99a1d0704493f40706279eb31f0e1a1a2023b14"
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

class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/releases/download/v0.4.0/manta-darwin-arm64.tar.gz"
  version "0.4.0"
  sha256 "4ea2fd05572195ee00a0cbcdd85c71f13cfc0442e069769fb73561fe4848bd35"
  license "MIT"

  def install
    bin.install "manta"
    generate_completions_from_executable(bin/"manta", "completion")
  end

  def caveats
    <<~EOS
      Quick start:
        manta init
        manta sub add main "https://your-clash-subscription-url"
        manta up --tun
        manta tui

      After upgrading (to switch running daemon & menu bar to the new version):
        manta down && manta up --tun && manta menubar -d
    EOS
  end

  test do
    assert_match "Manta", shell_output("#{bin}/manta --help")
  end
end

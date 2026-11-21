class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/releases/download/v0.3.5/manta-darwin-arm64.tar.gz"
  version "0.3.5"
  sha256 "63a319d41b1df15eae8dc78e6d451448f8f48306da144c63da2b74e29cea7dbd"
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
    EOS
  end

  test do
    assert_match "Manta", shell_output("#{bin}/manta --help")
  end
end

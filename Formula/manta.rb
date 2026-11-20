class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/releases/download/v0.2.4/manta-darwin-arm64.tar.gz"
  version "0.2.4"
  sha256 "6ae01500ddac9fdab6f9b7fd26406d91bc5722aa4246fb4b0c67f66b253393dc"
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

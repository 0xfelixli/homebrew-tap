class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/releases/download/v0.3.6/manta-darwin-arm64.tar.gz"
  version "0.3.6"
  sha256 "eb165ae9b8d12f6176f32b4fb4fd6962d5b552dabdf19ad40218691c19710718"
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

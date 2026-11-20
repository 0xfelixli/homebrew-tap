class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "83ec256f419dc426497e19af7ad6c8d46c55598c7c408756849449f71b96cf86"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    ldflags = "-s -w -X github.com/metacubex/mihomo/constant.Version=1.19.34"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/manta"
  end

  def caveats
    <<~EOS
      Quick start:
        manta init
        manta sub add main "https://your-clash-subscription-url"
        sudo manta up --tun
        manta tui
    EOS
  end

  test do
    assert_match "Manta", shell_output("#{bin}/manta --help")
  end
end

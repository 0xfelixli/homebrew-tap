class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "35e0fa8f2783292b6fe175ed8c45d4bcb6e5f9da559c1cbf4ea07a01e27d3168"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    ldflags = "-s -w -X github.com/metacubex/mihomo/constant.Version=1.19.34"
    system "go", "build", "-tags", "with_gvisor", *std_go_args(ldflags: ldflags), "./cmd/manta"
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

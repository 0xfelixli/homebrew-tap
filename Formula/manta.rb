class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager with embedded mihomo engine"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "fffe9bf6947ca451ae0c7e45d82ef77aef8b76536745f616b68d72b568398790"
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
        sudo manta up --tun
        manta tui
    EOS
  end

  test do
    assert_match "Manta", shell_output("#{bin}/manta --help")
  end
end

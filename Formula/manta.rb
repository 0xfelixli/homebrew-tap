class Manta < Formula
  desc "Sleek Go CLI, TUI & macOS menu bar proxy manager powered by mihomo (Clash Meta)"
  homepage "https://github.com/0xfelixli/manta"
  url "https://github.com/0xfelixli/manta/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ee4d593fefa2e61158591c1202a206484f83ba1d857f930da160e03e6f84dca8"
  license "MIT"

  depends_on "go" => :build
  depends_on "mihomo"

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/manta"
  end

  test do
    assert_match "Manta", shell_output("#{bin}/manta --help")
  end
end

class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.98"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.98/kubectl-x-darwin-arm64"
      sha256 "fbc372ad7d116ef0b4aa180dd44a83ce049c00761ab40be8e97268de432426d1"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.98/kubectl-x-darwin-amd64"
      sha256 "3825f58406aa76af4d15f0c582272072afc095de821d216fab58a0d95e3b954a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.98/kubectl-x-linux-amd64"
      sha256 "1ab90da9ae2dfa73c3d05e79140a9cc3cbbca1d36dbaa0b2f55c4747558c6cbe"
    end
  end

  depends_on "kubernetes-cli"

  def install
    binary = Dir.glob("kubectl-x-*").first || "kubectl-x"
    bin.install binary => "kubectl-x"
  end

  test do
    assert_match "kubectl x", shell_output("#{bin}/kubectl-x --help")
  end
end

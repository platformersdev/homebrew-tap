class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.91"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.91/kubectl-x-darwin-arm64"
      sha256 "9d84300a216743f23b78e8c3bdefcc22fbcdad5fbf409294fb8f2b9fa0db6a62"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.91/kubectl-x-darwin-amd64"
      sha256 "a093b403fdee7418e5813da5dbc963627005ff1f22bb605744ac320b8392d286"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.91/kubectl-x-linux-amd64"
      sha256 "5add360317c30336a0b15b5e136a61e4fd3fe521bcd05e722fb7e03a640fb9e5"
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

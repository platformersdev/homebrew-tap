class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.113"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.113/kubectl-x-darwin-arm64"
      sha256 "07f02c8eebecdc807b5a3ebb080c96f4b6699e7838ff5e2938502a6c282450ac"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.113/kubectl-x-darwin-amd64"
      sha256 "9bde68dad2803a03ca2d5f00e96b3f9bdb21dfb05d1511ae680b5dd3d649469d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.113/kubectl-x-linux-amd64"
      sha256 "baf9cb1cb81604c3f5fcfc9881ff33bd5264a3c723d0ed376c29263d8f66e450"
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

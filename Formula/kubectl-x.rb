class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.87"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.87/kubectl-x-darwin-arm64"
      sha256 "77f5e8736361fb5119a4a1df5732d6bc0a8de200aa34c551777d0379e5ab2b3c"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.87/kubectl-x-darwin-amd64"
      sha256 "bcc080d6e5e5d012816a84ddc3ec7f3ca1101b42aac4280173f3a6766e6451a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.87/kubectl-x-linux-amd64"
      sha256 "c126988e143cf71953297f4989172935960d2d883116fe0919d24aad6f90a88d"
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

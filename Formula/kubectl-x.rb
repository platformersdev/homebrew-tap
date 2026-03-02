class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.84"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v#{version}/kubectl-x-darwin-arm64"
      sha256 "c2e212200ed67429974d85f4007f8b1bd3a178a0fadd5a5a5eefb3f5263a9e13"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v#{version}/kubectl-x-darwin-amd64"
      sha256 "94b462a8f15c74647315b709b5300229a1ca6d221bf0927a154f60afd1569d9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v#{version}/kubectl-x-linux-amd64"
      sha256 "57d6310c7f37a7b0579a7579469864631c919a5ad46305588f1e52999ea5d79f"
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

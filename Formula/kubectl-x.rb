class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.101"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.101/kubectl-x-darwin-arm64"
      sha256 "b3c60a879e2b0de699cdcde1c9769ebe325c6d37337694250dfe2938d856c8b4"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.101/kubectl-x-darwin-amd64"
      sha256 "df8554d6841084f7b1e2c2808a0dc42078a00f9119d2e380d263ce78b53129e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.101/kubectl-x-linux-amd64"
      sha256 "f357fc308d778a30612c2c600b610ded1f1696c35a99d166190aa1a4f0c8db5e"
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

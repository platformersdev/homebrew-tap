class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.111"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.111/kubectl-x-darwin-arm64"
      sha256 "b7f1aded659cab2118d19fb97ef61f4d09f0b01cfbf81919c8dbad6bbeaae2ab"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.111/kubectl-x-darwin-amd64"
      sha256 "29db13d0d363c48ae2150e2d59570ad1d26361368a9e36cf30e513656f6502af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.111/kubectl-x-linux-amd64"
      sha256 "10434eb599cb2fa8294c149c4f46fb42d7496d9f83602d4ed0914e3b93a01c34"
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

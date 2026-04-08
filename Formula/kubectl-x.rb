class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.93"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.93/kubectl-x-darwin-arm64"
      sha256 "b06f638c542b51374e15ceeb31540480ab4028f9a059fe11de718ed230fc296a"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.93/kubectl-x-darwin-amd64"
      sha256 "010b1c67917540ea63d8b8c1122b29e2f8c432df495b46d8bd05dcdef53c8ed3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.93/kubectl-x-linux-amd64"
      sha256 "bba0032ee20a804efea8b57656f77baa6696cdd3bcf6f473c04f037dd2c72e4f"
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

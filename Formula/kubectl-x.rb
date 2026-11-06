class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.115"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.115/kubectl-x-darwin-arm64"
      sha256 "2a24945fa8cd0195821f158106d7435ef117180fa88c388af4c448d632dbbba6"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.115/kubectl-x-darwin-amd64"
      sha256 "985800de962fe7d9e9b30ff21dec6459549a6fc4fc1b81720bd7df4c798e2f28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.115/kubectl-x-linux-amd64"
      sha256 "613bba3e9a7c08b09daebfd6cfd5e1d267daf12d196554bc5bad2abba3a2e099"
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

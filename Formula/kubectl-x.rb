class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.96"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.96/kubectl-x-darwin-arm64"
      sha256 "101881d249e9f574c2b56aecbff230383428fa8120fb6b485f3ce7be6ce4615d"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.96/kubectl-x-darwin-amd64"
      sha256 "7127d78994a251a3bde9ff9f9a313b8bfc3935668e82b137e14f178280b25759"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.96/kubectl-x-linux-amd64"
      sha256 "2a7b81f1f75e914a5fdb8ea51fc01a5e386d47e3b900fdfc661a365ddada77c7"
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

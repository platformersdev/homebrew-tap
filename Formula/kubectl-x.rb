class KubectlX < Formula
  desc "kubectl plugin that runs commands against every context in parallel"
  homepage "https://github.com/platformersdev/kubectl-x"
  version "0.0.89"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.89/kubectl-x-darwin-arm64"
      sha256 "493ee03d93eb13b9cfa84a208f3d9c8a657e149b603cc8339ad8797a50d6b308"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.89/kubectl-x-darwin-amd64"
      sha256 "f2e59f880d6568c53d6c5b1a0d3b03d60e035beb64d424579c05fb3ff8772b7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "kubectl-x is not available for Linux ARM"
    else
      url "https://github.com/platformersdev/kubectl-x/releases/download/v0.0.89/kubectl-x-linux-amd64"
      sha256 "cbfacf41fb0b06eef9bfafdb002d64e281767d85db73d9637c2b7ee84bf6b546"
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

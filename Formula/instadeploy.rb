# Rendered by scripts/publish-public.sh at each release of instadeploy: do not
# edit by hand, the next release overwrites it.
class Instadeploy < Formula
  desc "Instant, agent-native deploys that keep working when CI is down"
  homepage "https://github.com/djabiridrissou/instadeploy-releases"
  version "0.6.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_darwin_arm64.tar.gz"
      sha256 "bf1a424837d3d63b89eef59f46872ffbe3c3ad7b2908c321a158c32f992e9289"
    end
    on_intel do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_darwin_amd64.tar.gz"
      sha256 "2263db19db5a0533d3defcdd3fe2b2be8c8fe1942d04bc33596de2860ab3b90b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_linux_arm64.tar.gz"
      sha256 "3981c21b4d7cd70712d7335ca95b4dc6ee7e7e1e74e08a58c0cdb64288419981"
    end
    on_intel do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_linux_amd64.tar.gz"
      sha256 "494d2b3530a7a73f221c09e2bff139b08dfcbfbb805a487078a384bfa6696881"
    end
  end

  def install
    bin.install "instadeploy"
  end

  def caveats
    <<~EOS
      Start: cd my-project && instadeploy init
      Agent: instadeploy agent setup   (Claude Code / Cursor through MCP)
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/instadeploy version")
  end
end

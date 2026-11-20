# Rendered by scripts/publish-public.sh at each release of instadeploy: do not
# edit by hand, the next release overwrites it.
class Instadeploy < Formula
  desc "Instant, agent-native deploys that keep working when CI is down"
  homepage "https://github.com/djabiridrissou/instadeploy-releases"
  version "0.6.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_darwin_arm64.tar.gz"
      sha256 "fd2123adb0c897256e7dbf0a0331183708d9e14db81fc8075150e119a0ee02f1"
    end
    on_intel do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_darwin_amd64.tar.gz"
      sha256 "ae6b99b4417e249c3a88f1fd8d45b42276efb14db54fa0ecd41fae43323eb55f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_linux_arm64.tar.gz"
      sha256 "f6a9bd111abb6e5576f166028cecce98671ef0212385cd142386bd255ffe30d1"
    end
    on_intel do
      url "https://github.com/djabiridrissou/instadeploy-releases/releases/download/v#{version}/instadeploy_#{version}_linux_amd64.tar.gz"
      sha256 "22c116490de1c807a29d8d094a64580581468b5f5ae5dbbfd75c5441a3d40a89"
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

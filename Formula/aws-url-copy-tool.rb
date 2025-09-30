class AwsUrlCopyTool < Formula
  desc "Auto-modify macOS clipboard for AWS URLs"
  homepage "https://github.com/esharf/aws-url-copy-tool"
  url "https://github.com/esharf/aws-url-copy-tool/releases/download/v1.0.1/aws-url-copy-tool-macos.zip"
  sha256 "2fd8d7362cdb1e3a08663862719f2a82d466fe8267343eba208fd185fcf7d673"
  version "1.0.1"

  def install
    bin.install "aws-url-copy-tool"
  end

  service do
    run [opt_bin/"aws-url-copy-tool"]
    keep_alive true
    log_path var/"log/aws-url-copy-tool.log"
    error_log_path var/"log/aws-url-copy-tool.err.log"
  end
end

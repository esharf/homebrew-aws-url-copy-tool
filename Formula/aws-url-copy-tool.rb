class AwsUrlCopyTool < Formula
  desc "Auto-modify macOS clipboard for AWS URLs"
  homepage "https://github.com/esharf/aws-url-copy-tool"
  url "https://github.com/esharf/aws-url-copy-tool/releases/download/v1.0.0/aws-url-copy-tool-macos.zip"
  sha256 "ae09e5a089abe9fc30f6b4c658ae54904ce63f59200b6a209e294f020f1e2737"
  version "1.0.0"

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

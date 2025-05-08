class AwsUrlCopyTool < Formula
  desc "Auto-modify macOS clipboard for AWS URLs"
  homepage "https://github.com/esharf/aws-url-copy-tool"
  url "https://github.com/esharf/aws-url-copy-tool/releases/download/vREPLACE_WITH_VERSION/aws-url-copy-tool-macos.zip"
  sha256 "REPLACE_WITH_ZIP_SHA"
  version "REPLACE_WITH_VERSION"

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

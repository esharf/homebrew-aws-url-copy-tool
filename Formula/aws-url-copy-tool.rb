class AwsUrlCopyTool < Formula
  desc "Auto-modify macOS clipboard for AWS URLs"
  homepage "https://github.com/esharf/aws-url-copy-tool"
  url "https://github.com/esharf/aws-url-copy-tool/releases/download/v1.0.2/aws-url-copy-tool-macos.zip"
  sha256 "e5f9bd708ee7126b289f091ec187178a2f5abd28c38e396ff8e35756f27708c5"
  version "1.0.2"

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

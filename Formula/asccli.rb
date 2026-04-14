# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.68"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.68/asc_v0.1.68_macOS_arm64"
    sha256 "92f79e6508304c9ca3f0d782e5fa3faca41620817cdd79fb048ec78db937bbbe"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.68/asc_v0.1.68_macOS_x86_64"
    sha256 "c3e1cb116ace1360d2429ec0324a707a408e8f78cd403b8191b5a66edd39ae76"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.68_macOS_arm64" : "asc_v0.1.68_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

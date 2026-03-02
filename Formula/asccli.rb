# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.34"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.34/asc_v0.1.34_macOS_arm64"
    sha256 "7ab933e26fd7d29a518a1f5524348c5316c38c0eabdb7fff4a2f30f7d71fd2ad"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.34/asc_v0.1.34_macOS_x86_64"
    sha256 "8cf819028e737d2cc8e4d859d98f3d706c93863c8cf0aaff58c8a1ddde6ff5ca"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.34_macOS_arm64" : "asc_v0.1.34_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

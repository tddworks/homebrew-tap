# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.41"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.41/asc_v0.1.41_macOS_arm64"
    sha256 "2a5f42dd3bf89321eb2c796a8ffd7f3d1bba13c8fb73f03d4370776caa0b0a3e"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.41/asc_v0.1.41_macOS_x86_64"
    sha256 "aaee96cc329ad3838d90d62a51857e46f01d0f0cd8e4126135985636766b8c6b"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.41_macOS_arm64" : "asc_v0.1.41_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

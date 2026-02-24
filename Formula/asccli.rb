# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.6"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.6/asc_v0.1.6_macOS_arm64"
    sha256 "497633d83b402dfe1fad0be940e1d988dfc950243753a57da56ee9087edc7605"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.6/asc_v0.1.6_macOS_x86_64"
    sha256 "354634f34c054d3f360d4a4418b65bafa04bb43bbbaae1bf0acc90a1d163cd8f"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.6_macOS_arm64" : "asc_v0.1.6_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

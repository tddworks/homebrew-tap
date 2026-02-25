# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.8"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.8/asc_v0.1.8_macOS_arm64"
    sha256 "611eb3f067bb7b305e3d489c1e9f1afda188f20040c7eebb49d3a72f1c468049"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.8/asc_v0.1.8_macOS_x86_64"
    sha256 "2b4bf056fe9bf0191c6dfe9c1384654357a36579993ff453b58ec433539767da"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.8_macOS_arm64" : "asc_v0.1.8_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

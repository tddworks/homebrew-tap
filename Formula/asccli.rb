# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.3"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.3/asc_v0.17.3_macOS_arm64"
    sha256 "e12b5b3843bb5f11c0178ee9ab36b8f38216015e239abe8810c8f7e8c3a9f333"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.3/asc_v0.17.3_macOS_x86_64"
    sha256 "5aa2186b0119343fd688909edf7aba5cdd368dad2c8038d1fb8e68d384932b07"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.3_macOS_arm64" : "asc_v0.17.3_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

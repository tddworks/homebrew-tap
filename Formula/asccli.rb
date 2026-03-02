# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.33"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.33/asc_v0.1.33_macOS_arm64"
    sha256 "c572729337c948a093e5d800ed50f7a01713598334c1b9cf43b52343d768211c"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.33/asc_v0.1.33_macOS_x86_64"
    sha256 "326dce0b2103763b6d58abcf68fd4fe48dc7a3fa4258ad58b29473ad25d230dd"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.33_macOS_arm64" : "asc_v0.1.33_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

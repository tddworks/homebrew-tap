# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.65"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.65/asc_v0.1.65_macOS_arm64"
    sha256 "59e3895e020ebc1c6a661029dadcfd75c7645093a729b795523242b8050663d3"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.65/asc_v0.1.65_macOS_x86_64"
    sha256 "a0d1fc859646556178f627327fbf2cd5d9f4f475a728a5b4a2e7bf3bc7758cfe"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.65_macOS_arm64" : "asc_v0.1.65_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

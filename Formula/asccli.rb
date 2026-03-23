# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.58"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.58/asc_v0.1.58_macOS_arm64"
    sha256 "dee6750d35f2da30efa003c45877218945c8e53e1385ce780012c762253f0dfa"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.58/asc_v0.1.58_macOS_x86_64"
    sha256 "922995dbd663021a2aff046eb5359201724e28966d88a5105cb76ea5889cb983"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.58_macOS_arm64" : "asc_v0.1.58_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

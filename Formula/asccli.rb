# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.74"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.74/asc_v0.1.74_macOS_arm64"
    sha256 "381368e8144e0e871288a86a3fdc46a8d41c79fe440df7049c93ac58d84d1da9"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.74/asc_v0.1.74_macOS_x86_64"
    sha256 "2cccc7bd6ed60be45b11d5cdd2bd4ff3182de11c0b24b6ea08812f0bb3a76106"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.74_macOS_arm64" : "asc_v0.1.74_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

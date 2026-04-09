# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.66"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.66/asc_v0.1.66_macOS_arm64"
    sha256 "cd48cdedcb1788e35650532ba691825a3e1f5094e9795c1100ec5961e9e9185d"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.66/asc_v0.1.66_macOS_x86_64"
    sha256 "348b335c93cdff9c30586c18f699379cee7a75eef8246ac9a7d758fb891a2aed"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.66_macOS_arm64" : "asc_v0.1.66_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

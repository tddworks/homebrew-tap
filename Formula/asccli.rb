# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.38"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.38/asc_v0.1.38_macOS_arm64"
    sha256 "88cb6f464e9a0d29038cd1ec8efa13b73a0cffaeb37e82497c80e5a140b0b223"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.38/asc_v0.1.38_macOS_x86_64"
    sha256 "51db0583c68ad02612b9935689ca2615227736540610d442e127ee4b1da49064"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.38_macOS_arm64" : "asc_v0.1.38_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.25"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.25/asc_v0.1.25_macOS_arm64"
    sha256 "6083e7d3676a0a7e6dc9924d67da5ec555561f1715f588e06877c8d15cd643af"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.25/asc_v0.1.25_macOS_x86_64"
    sha256 "63cc826398b1e91280b0fae58d6f8b6f9680a7babb51c0b6dfc525a278ec1292"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.25_macOS_arm64" : "asc_v0.1.25_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

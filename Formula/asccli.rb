# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.31"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.31/asc_v0.1.31_macOS_arm64"
    sha256 "4bf8037977a65ec89df8cfaa8a5246f3026e23f67c598f5785c8ab6169dc5aec"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.31/asc_v0.1.31_macOS_x86_64"
    sha256 "2ae99ad58a5c9c942567d70e706d55802d37b0cb976556c7369e300878286b9e"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.31_macOS_arm64" : "asc_v0.1.31_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

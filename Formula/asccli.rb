# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.60"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.60/asc_v0.1.60_macOS_arm64"
    sha256 "9c022130826d06a020380f9ab70b4a824d5678669ebbe64ffae7209451991ebb"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.60/asc_v0.1.60_macOS_x86_64"
    sha256 "007d821a0920308227a832679528f06b7babd062cfebc918ca3ddbf1f0d83f51"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.60_macOS_arm64" : "asc_v0.1.60_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

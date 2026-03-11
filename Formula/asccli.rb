# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.43"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.43/asc_v0.1.43_macOS_arm64"
    sha256 "bcf082572af571d03d8ac550984964e0aaab5b65c69ded9cadfcaa1bd007b395"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.43/asc_v0.1.43_macOS_x86_64"
    sha256 "79c9b68c35bb29217ea7821a0ec23825d5ca8c4a7f909cd82757018cbc104b2d"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.43_macOS_arm64" : "asc_v0.1.43_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

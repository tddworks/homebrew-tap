# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.27"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.27/asc_v0.1.27_macOS_arm64"
    sha256 "83ff39d195b63d2dab773e632b926cceec7c1f2b70b35d381ca08182f8d46b54"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.27/asc_v0.1.27_macOS_x86_64"
    sha256 "60f34a920247e06a6bddc85bb06b147696ea99193aa04c22844f15908def6331"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.27_macOS_arm64" : "asc_v0.1.27_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

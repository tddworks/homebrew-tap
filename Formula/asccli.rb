# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.61"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.61/asc_v0.1.61_macOS_arm64"
    sha256 "4961f4cfbe08f318fefcceca234e88d6e604d83021b9d45c0ec26d1af6b23e8a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.61/asc_v0.1.61_macOS_x86_64"
    sha256 "f2331f3c67afbdea067d79f48a010208c9620450f74af1977648562595861e84"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.61_macOS_arm64" : "asc_v0.1.61_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

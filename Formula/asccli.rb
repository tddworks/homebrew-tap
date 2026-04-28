# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.5"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.5/asc_v0.17.5_macOS_arm64"
    sha256 "bf50b6a9a0eb39335830dab71b134a72c03bddacb16595031c1b76c59c53f778"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.5/asc_v0.17.5_macOS_x86_64"
    sha256 "b6af8326ab6c85922a149c573d1e182ecc36af79ee3f6f28fc2205c5b6d2f424"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.5_macOS_arm64" : "asc_v0.17.5_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

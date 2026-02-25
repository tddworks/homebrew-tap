# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.9"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.9/asc_v0.1.9_macOS_arm64"
    sha256 "45f0eb7244cf190b0f870aa7432a00084c212dbbadd5af52a4a002af5e17a352"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.9/asc_v0.1.9_macOS_x86_64"
    sha256 "ac7e0cd5fed8f9a3b39af6198eac275f378b193901760725d2703949c81084af"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.9_macOS_arm64" : "asc_v0.1.9_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.7"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.7/asc_v0.1.7_macOS_arm64"
    sha256 "3d25796d768d01dc652f0dc8669b5fb4be8144c31b99653692058bfc6e782073"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.7/asc_v0.1.7_macOS_x86_64"
    sha256 "d9cbec1b32606ee1dcb5ae4ec8889b1cff16d11e854bcc15f3795c23ce05a0f1"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.7_macOS_arm64" : "asc_v0.1.7_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

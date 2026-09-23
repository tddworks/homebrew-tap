# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.4"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.4/asc_v0.18.4_macOS_arm64"
    sha256 "fbec16e4cc5e88fb12b2ef9b566654970568b588e829632f8347dcf44fe0f5c9"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.4/asc_v0.18.4_macOS_x86_64"
    sha256 "2fce0c8c23665a6e534a3fef1fbc6848826b2c098c1fa5c505f72f389a28c8e2"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.4_macOS_arm64" : "asc_v0.18.4_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

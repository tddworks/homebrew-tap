# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.24"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.24/asc_v0.1.24_macOS_arm64"
    sha256 "dfe4e1fa1d1b1d45228e142fbaaea308c6ef4c1ca8f481cf22ab7779ceba2d0a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.24/asc_v0.1.24_macOS_x86_64"
    sha256 "1ced2077de898dcaea104477c5f344f23adfd1d74f5da8b4f9f53f6aed93b273"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.24_macOS_arm64" : "asc_v0.1.24_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

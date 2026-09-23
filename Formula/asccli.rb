# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.85"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.85/asc_v0.1.85_macOS_arm64"
    sha256 "ed38c5b78db3046ff33004a1dc570b233ca89f3fa221ed22c80354d9f2665033"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.85/asc_v0.1.85_macOS_x86_64"
    sha256 "f132ecd20e4675e709bded58637420cfb3ad8da9c5d2e39a1b207c72449bfb04"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.85_macOS_arm64" : "asc_v0.1.85_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

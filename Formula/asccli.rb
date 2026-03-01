# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.32"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.32/asc_v0.1.32_macOS_arm64"
    sha256 "303778b4e532035b038dd5d572ec2bc0ab2d4bfcdfcf8c57bf4cea9111485308"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.32/asc_v0.1.32_macOS_x86_64"
    sha256 "61c58dc322f262e8ba4b6d9fc2f2e4def5a87e0b23f935e05e523d37ba0a3a81"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.32_macOS_arm64" : "asc_v0.1.32_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

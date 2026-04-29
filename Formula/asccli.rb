# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.7"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.7/asc_v0.17.7_macOS_arm64"
    sha256 "44cb5a6656334640bc8f58b167c65f7dd9366de297d6952f7f9205c21db5006e"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.7/asc_v0.17.7_macOS_x86_64"
    sha256 "092986fc97b720fbe18fb9bf62d6384187a9c6d9c9949ff50269a44748939912"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.7_macOS_arm64" : "asc_v0.17.7_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

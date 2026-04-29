# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.8"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.8/asc_v0.17.8_macOS_arm64"
    sha256 "8ca58fe10c9013654a911eed5ba73b0362ca555875770f70a22dbaf34bbd8d90"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.8/asc_v0.17.8_macOS_x86_64"
    sha256 "5a34432abf0266d39ff3d7bc9f4cfe7fbd776f62fba2f43d63201c6edfe8cd34"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.8_macOS_arm64" : "asc_v0.17.8_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

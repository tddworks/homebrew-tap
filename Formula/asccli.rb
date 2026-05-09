# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.9"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.9/asc_v0.17.9_macOS_arm64"
    sha256 "2594a2327827691d6bdb6d26e9977376991d8e0cf0e1195d98955e519f7d4d0b"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.9/asc_v0.17.9_macOS_x86_64"
    sha256 "8651cb3ec1daa421eaeb9d1a9f02ae05c46e8e01b590df3f4e2fd7512edaee9b"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.9_macOS_arm64" : "asc_v0.17.9_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

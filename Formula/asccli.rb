# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.5"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.5/asc_v0.1.5_macOS_arm64"
    sha256 "edfb3ab0e2200a41e41d24deb5c8f3219da90d97c1ce433e7916fd56ca184ebe"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.5/asc_v0.1.5_macOS_x86_64"
    sha256 "00ef437c7d8822ff6f2cfa11baba126f83b2ebf091cdd2d089decd66c215aa51"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.5_macOS_arm64" : "asc_v0.1.5_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

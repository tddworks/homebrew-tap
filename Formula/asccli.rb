# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.21"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.21/asc_v0.1.21_macOS_arm64"
    sha256 "c9069050f63daa4170d3c08b4b235c1fb3e1d99edba798aff1311d6e3d590084"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.21/asc_v0.1.21_macOS_x86_64"
    sha256 "1dc77019b4ae69da0fd6f2b3d5f39903b6bcf2b775cd34e649338c0ba5cea94f"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.21_macOS_arm64" : "asc_v0.1.21_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

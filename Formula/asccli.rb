# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.37"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.37/asc_v0.1.37_macOS_arm64"
    sha256 "a213354ac10ad1471f88cc7ee4e0ebe13410a3e7e145823078565b2c627286f8"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.37/asc_v0.1.37_macOS_x86_64"
    sha256 "564ab264336824694d42689621d96a4be0a12b4a00ef21f4553ad4c1bf79d190"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.37_macOS_arm64" : "asc_v0.1.37_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

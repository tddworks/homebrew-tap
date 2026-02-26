# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.23"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.23/asc_v0.1.23_macOS_arm64"
    sha256 "4e1a9a82ee10c1c8c76c708d8039198acae82a60e6ee329db56b06cc9ccff779"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.23/asc_v0.1.23_macOS_x86_64"
    sha256 "d70d61b3e9e433384da16d9bdc8bf145addf50dff752204d2d9651a316d2617b"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.23_macOS_arm64" : "asc_v0.1.23_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

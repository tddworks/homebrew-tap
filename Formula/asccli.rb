# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.45"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.45/asc_v0.1.45_macOS_arm64"
    sha256 "376e07c0b5ebdde98704d388667e9f15da1dbe3ce403658f0533d092de1fc26a"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.45/asc_v0.1.45_macOS_x86_64"
    sha256 "826cd6d531d7089dab51f8486f56a4605129b38ff73a5a576eddd7e871f03960"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.45_macOS_arm64" : "asc_v0.1.45_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

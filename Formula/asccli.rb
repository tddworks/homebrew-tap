# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.64"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.64/asc_v0.1.64_macOS_arm64"
    sha256 "b23722b0133511b68ba28bd26b597a0973362bcd0a42446ae22de492e01ef178"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.64/asc_v0.1.64_macOS_x86_64"
    sha256 "b719cbc2294a4274a8fdcc95743ff23408b6578493bf024359e1ee8453abc342"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.64_macOS_arm64" : "asc_v0.1.64_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.6"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.6/asc_v0.17.6_macOS_arm64"
    sha256 "612d96bc9e522096b0943fe2903f263744fa8ccbf1ce163e514014e7c5fc9201"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.6/asc_v0.17.6_macOS_x86_64"
    sha256 "7ea15789331d722c7149352819a3f25b9a5b1016ce35336d8e575451b587917c"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.6_macOS_arm64" : "asc_v0.17.6_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.49"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.49/asc_v0.1.49_macOS_arm64"
    sha256 "c996f0ca05b4e36d09a34c88abd6e37d984dd2016d1c94d6c7dba25d678cbbca"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.49/asc_v0.1.49_macOS_x86_64"
    sha256 "5776f0bcfecb4132dcb2a6eb26acce815158ed3472ebf482311735b176c5610a"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.49_macOS_arm64" : "asc_v0.1.49_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

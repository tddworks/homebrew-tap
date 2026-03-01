# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.30"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.30/asc_v0.1.30_macOS_arm64"
    sha256 "1d4e5b53633fe76262b51090f93f12625731a5177f08daa3b3e5f862d2222c14"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.30/asc_v0.1.30_macOS_x86_64"
    sha256 "56134a784ffaa414ca898f7e2cff48617ed1a96a3b5442705136da3159ab7b37"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.30_macOS_arm64" : "asc_v0.1.30_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

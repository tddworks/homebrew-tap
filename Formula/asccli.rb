# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.22"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.22/asc_v0.1.22_macOS_arm64"
    sha256 "ddf8cfc66144184fb1b221da57ccbb8d6e713a5ee6f019dfb7cbce2536ca7e02"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.22/asc_v0.1.22_macOS_x86_64"
    sha256 "cc118f5d23a713b41a747120d21c3a701d130f8abc35c7335d08af92df0b235d"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.22_macOS_arm64" : "asc_v0.1.22_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

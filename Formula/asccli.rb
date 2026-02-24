# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.4"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.4/asc_v0.1.4_macOS_arm64"
    sha256 "13f63406c0179bf5f8465f3888c57616cd496f965514ebbabbaf7a88166f60d8"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.4/asc_v0.1.4_macOS_x86_64"
    sha256 "4a865391f4a6e0a95e48c6e5a3480f65b24676a6ec110358e9cdc2eadd2e3db6"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.4_macOS_arm64" : "asc_v0.1.4_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

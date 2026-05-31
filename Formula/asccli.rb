# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.1"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.1/asc_v0.18.1_macOS_arm64"
    sha256 "16d770a66e9d2b1774a9ec7efc7f11b428794ff501fa52a8166a4a3460124446"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.1/asc_v0.18.1_macOS_x86_64"
    sha256 "f921527a6e3b305bed0637f9ef73faa2c317c35e656e86de2b50dbc6c58073b8"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.1_macOS_arm64" : "asc_v0.18.1_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

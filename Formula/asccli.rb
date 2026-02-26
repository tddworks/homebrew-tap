# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.20"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.20/asc_v0.1.20_macOS_arm64"
    sha256 "ee163b278e35be26fbb9702ef46418e11d689eb02c4e83b886725f4ce0e21179"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.20/asc_v0.1.20_macOS_x86_64"
    sha256 "a2a3bf72784e26bdd67a55f72828f0d97d7a96beb061b9a9b87a71791bb72c28"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.20_macOS_arm64" : "asc_v0.1.20_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

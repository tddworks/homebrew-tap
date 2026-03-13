# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.47"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.47/asc_v0.1.47_macOS_arm64"
    sha256 "9ccd899e8d0fabceda207cfcdac774b1b20b8d3b56665a23f647573e7b932f71"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.47/asc_v0.1.47_macOS_x86_64"
    sha256 "f722b3aead2f3a9135afbbb9132f8732251501f29a7bafa1a82d92863a88aa2d"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.47_macOS_arm64" : "asc_v0.1.47_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

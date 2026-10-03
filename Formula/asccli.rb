# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.18.5"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.5/asc_v0.18.5_macOS_arm64"
    sha256 "5b7c2b9b3e0b381844487919ae1690cbfaa1ffe66aac53697692cff755ae6642"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.18.5/asc_v0.18.5_macOS_x86_64"
    sha256 "b49e861545597beeeb8bd2a90fac5b3f32b89bd4a8a8f5dff0c3604b23760d2a"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.18.5_macOS_arm64" : "asc_v0.18.5_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

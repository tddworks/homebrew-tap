# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.59"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.59/asc_v0.1.59_macOS_arm64"
    sha256 "13d0fc7c52ddcd37a6151d72b079859476049fb7a4aeb84a340f4b744f64f353"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.59/asc_v0.1.59_macOS_x86_64"
    sha256 "b9a19d2849dcfeda6ade4d551e6e0fe7796749904c62975e827c422879f06ed5"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.59_macOS_arm64" : "asc_v0.1.59_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

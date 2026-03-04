# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.35"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.35/asc_v0.1.35_macOS_arm64"
    sha256 "297fe69aacffd39e608df457a328a12b83f3881e4446b8fb907407b5d579f618"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.35/asc_v0.1.35_macOS_x86_64"
    sha256 "f80bc9a94716bf7d10e8cf7c86ea76b7806c8f0efa7f9508f0e8f987c1d7f700"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.35_macOS_arm64" : "asc_v0.1.35_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

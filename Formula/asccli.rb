# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.17.2"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.2/asc_v0.17.2_macOS_arm64"
    sha256 "b5965a0f8dc28e2f0c873c4b9161ecc4430e7f1c8237cbd6dec6557fc24733df"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.17.2/asc_v0.17.2_macOS_x86_64"
    sha256 "0a6b872316e798203e10d8c78ed9e42c14189866651795126eaec48aebd719fa"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.17.2_macOS_arm64" : "asc_v0.17.2_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

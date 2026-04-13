# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.67"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.67/asc_v0.1.67_macOS_arm64"
    sha256 "14c49cda289edc4d9cc28082f45df01e94fdb74a927c7a866d55c48e3f6a8702"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.67/asc_v0.1.67_macOS_x86_64"
    sha256 "721008c22681ebbb90e4172df88439cfeed4c1955ee212686e6552ef0ec41197"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.67_macOS_arm64" : "asc_v0.1.67_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

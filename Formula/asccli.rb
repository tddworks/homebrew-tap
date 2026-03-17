# typed: false
# frozen_string_literal: true

class Asccli < Formula
  desc "App Store Connect CLI — manage apps, versions, and screenshots from your terminal"
  homepage "https://github.com/tddworks/asc-cli"
  version "v0.1.51"
  license "MIT"

  on_arm do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.51/asc_v0.1.51_macOS_arm64"
    sha256 "da416e6b3605d4b97ae2b4fc7bdbc4a1b29a822723ac8ad8a7ea94406b9e67d0"
  end

  on_intel do
    url "https://github.com/tddworks/asc-cli/releases/download/v0.1.51/asc_v0.1.51_macOS_x86_64"
    sha256 "79de2f4943e14a2f2d349c6932de14043c596e87b35bcbf227e1e5f7faa46429"
  end

  depends_on :macos

  def install
    binary = Hardware::CPU.arm? ? "asc_v0.1.51_macOS_arm64" : "asc_v0.1.51_macOS_x86_64"
    bin.install binary => "asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

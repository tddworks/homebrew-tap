# typed: false
# frozen_string_literal: true

class Baguette < Formula
  desc "Headless iOS Simulator manager + host-side input injection for iOS 26"
  homepage "https://github.com/tddworks/baguette"
  version "v0.1.0"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/baguette/releases/download/v0.1.0/baguette_v0.1.0_macOS_arm64"
    sha256 "2fa7ce8671c02d19c584fcf42f07a9874e3adf3e7b11eb53cd947acdbd1bb07d"
  end

  depends_on :macos
  depends_on arch: :arm64
  depends_on xcode: ["26.0", :build]

  def install
    bin.install "baguette_v0.1.0_macOS_arm64" => "baguette"
  end

  def caveats
    <<~EOS
      baguette links against private SimulatorKit and CoreSimulator
      frameworks shipped with Xcode 26. Make sure Xcode 26 is installed
      and `xcode-select` points at it before running `baguette serve`.
    EOS
  end

  test do
    assert_match "baguette", shell_output("#{bin}/baguette --help")
  end
end

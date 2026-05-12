# typed: false
# frozen_string_literal: true

class Baguette < Formula
  desc "Headless iOS Simulator manager + host-side input injection for iOS 26"
  homepage "https://github.com/tddworks/baguette"
  version "v0.1.71"
  license "Apache-2.0"

  on_arm do
    url "https://github.com/tddworks/baguette/releases/download/v0.1.71/baguette_v0.1.71_macOS_arm64.tar.gz"
    sha256 "b5edfdea722545780f64143bd303e7105926714f002d7f37b3a4d546f188e443"
  end

  depends_on :macos
  depends_on arch: :arm64
  depends_on xcode: ["26.0", :build]

  def install
    # Binary and its SPM resource bundle must sit side-by-side at
    # runtime — WebRoot resolves the bundle via dladdr from the
    # executable's directory. Install both into libexec and symlink
    # the binary into bin.
    libexec.install "Baguette" => "baguette"
    libexec.install "Baguette_Baguette.bundle"
    bin.install_symlink libexec/"baguette"
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

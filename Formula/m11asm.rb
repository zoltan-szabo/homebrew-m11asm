class M11asm < Formula
  desc "MACRO-11 assembler for DCJ-11 / PDP-11"
  homepage "https://github.com/zoltan-szabo/m11asm"
  url "https://github.com/zoltan-szabo/m11asm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin.install ".build/release/m11asm"
  end

  test do
    (testpath/"test.mac").write("NOP\n")
    system bin/"m11asm", "test.mac"
    assert_predicate testpath/"test.oct", :exist?
    assert_match "@000000", (testpath/"test.oct").read
  end
end

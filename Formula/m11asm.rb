class M11asm < Formula
  desc "MACRO-11 assembler for DCJ-11 / PDP-11"
  homepage "https://github.com/zoltan-szabo/m11asm"
  url "https://github.com/zoltan-szabo/m11asm/releases/download/v0.1.0/m11asm-v0.1.0-macos-universal.zip"
  sha256 "3e9e601ca0bf765d223a86e205644b4d3099b506030da1c3587a6b9e1ac4ccec"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "m11asm"
  end

  test do
    (testpath/"test.mac").write("NOP\n")
    system bin/"m11asm", "test.mac"
    assert_predicate testpath/"test.oct", :exist?
    assert_match "@000000", (testpath/"test.oct").read
  end
end

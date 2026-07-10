class M11asm < Formula
  desc "MACRO-11 assembler for DCJ-11 / PDP-11"
  homepage "https://github.com/zoltan-szabo/m11asm"
  url "https://github.com/zoltan-szabo/m11asm/releases/download/v0.4.1/m11asm-v0.4.1-macos-universal.zip"
  sha256 "5d823b71b1fd562d86cf226fd095f234dbeb9c12c68ea5bfa891cf73c5dc685a"
  version "0.4.1"
  license "MIT"

  depends_on :macos

  def install
    bin.install "m11asm"
  end

  test do
    (testpath/"test.mac").write("NOP\n")
    system bin/"m11asm", "test.mac"
    assert_predicate testpath/"test.oct", :exist?
    assert_match "@001000", (testpath/"test.oct").read
    assert_match version.to_s, shell_output("#{bin}/m11asm --version")
  end
end

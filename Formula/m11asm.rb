class M11asm < Formula
  desc "MACRO-11 assembler for DCJ-11 / PDP-11"
  homepage "https://github.com/zoltan-szabo/m11asm"
  url "https://github.com/zoltan-szabo/m11asm/releases/download/v0.3.0/m11asm-v0.3.0-macos-universal.zip"
  sha256 "fc2b199bc5c8ed4bc9af2b5202ea61ff23ae48f79254e1d0c93c23a5d69f7007"
  version "0.3.0"
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

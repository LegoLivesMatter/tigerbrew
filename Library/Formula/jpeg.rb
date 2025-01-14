class Jpeg < Formula
  desc "JPEG image manipulation library"
  homepage "http://www.ijg.org"
  url "http://www.ijg.org/files/jpegsrc.v8d.tar.gz"
  sha256 "d625ad6b3375a036bf30cd3b0b40e8dde08f0891bfd3a2960650654bdb50318c"

  bottle do
    cellar :any
    revision 2
    sha256 "bbc74f8b5980065d7bf95927150c2d56806d30abea459c2b1edcbdeed2d7c458" => :el_capitan
    sha1 "a0d4d16fcbee7ad6ef49f16bb55650291b877885" => :yosemite
    sha1 "f668b1e9cb382e194c632c1d5865b7bea096c3ac" => :mavericks
    sha1 "4dd056f2bf243eef145a613ed1a51e65e4b5d0a4" => :mountain_lion
    sha1 "396612e00ac31ca730d913ebdfd1b99881304702" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/djpeg", test_fixtures("test.jpg")
  end
end

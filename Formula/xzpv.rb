class Xzpv < Formula
  desc "Cross-platform XZ archiver with visual progress indicator"
  homepage "https://github.com/Grimmslaw/xzpv.git"
  url "https://github.com/Grimmslaw/xzpv/archive/refs/tags/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "deebbe380b18213a207eef905d9ecbbc5c152c1fb5952b72316ff45f2046ff83"
  license "MIT"

  # build-time dependencies
  depends_on "cmake" => :build

  # runtime dependencies
  depends_on "pv"
  depends_on "xz"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  def post_install
    system "#{bin}/xzpv", "--install"
  end

  def caveats
    <<~EOS
      The default configuration file was automatically deployed to:
        ~/.config/xzpv/xzpv.conf
    EOS
  end

  test do
    system "#{bin}/xzpv", "--version"
  end
end

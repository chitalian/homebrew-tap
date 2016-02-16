class Simbody < Formula
  desc     "Download, compile and install Simbody."
  homepage "https://github.com/simbody/simbody"
  url      "https://github.com/simbody/simbody/archive/Simbody-3.5.3.tar.gz"
  version  "3.5.3"
  sha256   "8005fbdb16c6475f98e13b8f1423b0e9951c193681c2b0d19ae5b711d7e24ec1"
  head     "https://github.com/simbody/simbody.git"

  option "with-Release"       , "Set build-type to Release."
  option "with-RelWithDebInfo", "Set build-type to RelWithDebInfo."
  option "with-Debug"         , "Set build-type to Debug."
  
  depends_on "cmake" => :build

  def install
    Dir.mkdir "build"
    Dir.chdir "build"
    build_type = "Release"
    if build.with? "RelWithDebInfo"
      build_type = "RelWithDebInfo"
    end
    if build.with? "Debug"
      build_type = "Debug"
    end
    system "cmake", "..",
           "-DBUILD_EXAMPLES=OFF",
           "-DBUILD_TESTING=OFF",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_BUILD_TYPE=#{build_type}"
    system "make", "install"
  end
end

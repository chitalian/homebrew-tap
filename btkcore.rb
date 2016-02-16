class Btkcore < Formula
  version  "0.3.01"
  desc     "Download, compiler and install BTKCore."
  homepage "https://github.com/klshrinidhi/BTKCore"
  url      "https://github.com/klshrinidhi/BTKCore/archive/"\
           "BTKCore-0.3.01.tar.gz"
  sha256   "cadf08e126d23f45327d1faf958082788cc523068cdf9a583841c5229728c286"

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
           "-DBUILD_SHARED_LIBS=ON",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_BUILD_TYPE=#{build_type}"
    system "make", "install"
  end
end

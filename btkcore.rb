class Btkcore < Formula
  version  "0.3.01"
  desc     "Download, compiler and install BTKCore."
  homepage "https://github.com/klshrinidhi/BTKCore"
  url      "https://github.com/klshrinidhi/BTKCore/archive/"\
           "BTKCore-0.3.01.tar.gz"
  sha256   "cadf08e126d23f45327d1faf958082788cc523068cdf9a583841c5229728c286"

  option "with-btype-Release"        "\n\tSet build-type to Release [Default]."
  option "with-btype-RelWithDebInfo" "\n\tSet build-type to RelWithDebInfo."
  option "with-btype-Debug"          "\n\tSet build-type to Debug."

  depends_on "cmake" => :build

  def install
    Dir.mkdir "build"
    Dir.chdir "build"
    if build.with? "RelWithDebInfo"
      cmake_build_type = "RelWithDebInfo"
    elsif build.with? "Debug"
      cmake_build_type = "Debug"
    else
      cmake_build_type = "Release"
    end
    system "cmake", "..",
           "-DBUILD_SHARED_LIBS=ON",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_BUILD_TYPE=#{cmake_build_type}"
    system "make", "install"
  end
end

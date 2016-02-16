class Btkcore < Formula
  version  "0.3.1"
  desc     "Download, compiler and install BTKCore."
  homepage "https://github.com/klshrinidhi/BTKCore"
  url      "https://github.com/klshrinidhi/BTKCore.git",
           :revision => "ae0d2a43de0fe6c9ef2acce34a87c944dd113829"

  option "with-Release"       , "Set build-type to Release."
  option "with-RelWithDebInfo", "Set build-type to RelWithDebInfo."
  option "with-Debug"         , "Set build-type to Debug."

  depends_on "cmake" => :build

  def install
    Dir.mkdir "build"
    Dir.chdir "build"
    build_type = "RelWithDebInfo"
    if build.with? "Release"
      build_type = "Release"
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

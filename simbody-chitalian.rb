class Simbody < Formula
  desc     "Download, compile and install Simbody."
  homepage "https://github.com/simbody/simbody"
  url      "https://github.com/simbody/simbody.git",
           :revision => "b98b6813dd87163a92be779cf4dd684e2f124d13"
  version  "3.6"

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
           "-DBUILD_EXAMPLES=OFF",
           "-DBUILD_TESTING=OFF",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_BUILD_TYPE=#{build_type}"
    system "make", "install"
  end
end

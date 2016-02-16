class OpensimCore < Formula
  desc     "Download, compile and install OpenSim."
  homepage "https://github.com/opensim-org/opensim-core"
  url      "https://github.com/opensim-org/opensim-core.git",
           :revision => "9adc751b8e53248e2355b50e0802a99e844d5ed0"
  version  "4.0"

  option "with-Release"       , "Set build-type to Release."
  option "with-RelWithDebInfo", "Set build-type to RelWithDebInfo."
  option "with-Debug"         , "Set build-type to Debug."
  
  depends_on "cmake"   => :build
  depends_on "swig"
  depends_on :java
  depends_on "simbody"
  depends_on "btkcore" => "--HEAD"

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
           "-DBTK_DIR=/usr/local/opt/btkcore/share/btk-0.4.dev",
           "-DSIMBODY_HOME=/usr/local/opt/simbody",
           "-DBUILD_PYTHON_WRAPPING=ON",
           "-DBUILD_JAVA_WRAPPING=ON",
           "-DBUILD_TESTING=OFF",
           "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "-DCMAKE_BUILD_TYPE=#{build_type}"
    system "make", "install"
  end
end

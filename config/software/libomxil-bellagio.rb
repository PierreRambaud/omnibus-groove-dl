name 'libomxil-bellagio'
default_version '0.9.3'

source(url: "http://downloads.sourceforge.net/omxil/libomxil-bellagio-#{version}.tar.gz",
       md5: 'a1de827fdb75c02c84e55f740ca27cb8')

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command('./configure' \
          " --prefix=#{install_dir}/embedded" \
          " --with-zlib-prefix=#{install_dir}/embedded", env: env)

  make "-j #{workers}", env: env
  make 'install', env: env
end

name 'libpng'
default_version '1.2.52'

dependency 'zlib'

source(url: "http://downloads.sourceforge.net/libpng/libpng-#{version}.tar.gz",
       md5: '89dbefdbe268cdfeb5525adde805272f')

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command('./configure' \
          " --prefix=#{install_dir}/embedded" \
          " --with-zlib-prefix=#{install_dir}/embedded", env: env)

  make "-j #{workers}", env: env
  make 'install', env: env
end

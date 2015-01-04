name 'libiconv'

default_version '1.14'

source url: "http://ftp.gnu.org/pub/gnu/libiconv/libiconv-#{version}.tar.gz",
       md5: 'e34509b1623cec449dfeb73d7ce9c6c6'

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  env.merge!(
    'LDFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'CFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'LD_RUN_PATH' => "#{install_dir}/embedded/lib"
  )

  configure_command = './configure' \
                      " --prefix=#{install_dir}/embedded"

  patch source: 'libiconv-1.14_srclib_stdio.in.h-remove-gets-declarations.patch'

  command configure_command, env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install-lib" \
          " libdir=#{install_dir}/embedded/lib" \
          " includedir=#{install_dir}/embedded/include", env: env
end

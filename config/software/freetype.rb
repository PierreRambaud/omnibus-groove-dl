name 'freetype'

default_version '2.5.5'

source(url: "http://download.savannah.gnu.org/releases/freetype/freetype-#{version}.tar.gz",
       md5: '7448edfbd40c7aa5088684b0a3edb2b8')

relative_path "#{name}-#{version}"

dependency 'pcre'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)
  env.merge!(
    'LDFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'CFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'LD_RUN_PATH' => "#{install_dir}/embedded/lib"
  )

  command(cmd,
          env: env)
  command("make -j #{workers}",
          env: env)
  command('make install',
          env: env)
end

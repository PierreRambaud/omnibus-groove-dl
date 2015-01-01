name 'freetype'
default_version '2.5.5'
dependency 'pcre'

source(url: "http://download.savannah.gnu.org/releases/freetype/freetype-#{version}.tar.gz",
       md5: '7448edfbd40c7aa5088684b0a3edb2b8')

relative_path "freetype-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')
  env = {
    'LDFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'CFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'LD_RUN_PATH' => "#{install_dir}/embedded/lib"
  }

  command(cmd,
          env: env)
  command("make -j #{workers}",
          env: { 'LD_RUN_PATH' => "#{install_dir}/embedded/lib" })
  command('make install',
          env: { 'LD_RUN_PATH' => "#{install_dir}/embedded/lib" })
end

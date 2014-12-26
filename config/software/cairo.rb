
name 'cairo'
default_version '1.12.14'

source url: "http://cairographics.org/releases/cairo-#{version}.tar.xz",
       md5: '27b634113d0f52152d60ae8e2ec7daa7'

relative_path 'cairo-1.12.14'

dependency 'libpng'
dependency 'pixman'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')
  env = {
    'LDFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'CFLAGS' => "-L#{install_dir}/embedded/lib" \
    " -I#{install_dir}/embedded/include",
    'LD_RUN_PATH' => "#{install_dir}/embedded/lib",
    'PKG_CONFIG_PATH' => "#{install_dir}/embedded/lib/pkgconfig"
  }

  command(cmd,
          env: env)
  command("make -j #{workers}",
          env: { 'LD_RUN_PATH' => "#{install_dir}/embedded/lib" })
  command('make install',
          env: { 'LD_RUN_PATH' => "#{install_dir}/embedded/lib" })
end

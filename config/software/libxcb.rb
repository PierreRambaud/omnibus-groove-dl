name 'libxcb'
default_version '1.9'

source(url: "http://xcb.freedesktop.org/dist/libxcb-#{version}.tar.gz",
       md5: 'd92657d958dfd222a12f4e936a7a26c8')

dependency 'libtool'
dependency 'libxslt'

relative_path "#{name}-#{version}"

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

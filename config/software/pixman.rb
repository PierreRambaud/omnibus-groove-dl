name 'pixman'
default_version '0.32.4'

source(url: "http://cairographics.org/releases/pixman-#{version}.tar.gz",
       md5: 'eba449138b972fbf4547a8c152fea162')

relative_path 'pixman-0.32.4'
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

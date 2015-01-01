name 'fontconfig'
default_version '2.11.91'

source(url: "http://www.freedesktop.org/software/fontconfig/release/fontconfig-#{version}.tar.gz",
       md5: 'aa5364ab1c5038b2585451e356995083')

relative_path "fontconfig-#{version}"

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

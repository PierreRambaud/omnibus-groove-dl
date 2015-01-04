name 'pixman'
default_version '0.32.4'

source(url: "http://cairographics.org/releases/pixman-#{version}.tar.gz",
       md5: 'eba449138b972fbf4547a8c152fea162')

relative_path "#{name}-#{version}"

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

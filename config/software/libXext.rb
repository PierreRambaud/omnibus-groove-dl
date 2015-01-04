name 'libXext'
default_version '1.3.3'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/libXext-#{version}.tar.gz",
       md5: '5e3e75160ab6a8c212d0ecd82aa04651')

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

name 'libXau'
default_version '1.0.8'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/libXau-#{version}.tar.gz",
       md5: 'a85cd601d82bc79c0daa280917572e20')

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

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

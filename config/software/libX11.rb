name 'libX11'
default_version '1.6.2'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/libX11-#{version}.tar.gz",
       md5: '7e17129e1678355d8268883ee31a6edf')

relative_path "#{name}-#{version}"

dependency 'util-macros'
dependency 'xtrans'
dependency 'libxcb'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--without-xmlto'
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

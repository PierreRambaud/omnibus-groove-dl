name 'xtrans'
default_version '1.3.5'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: '6e4eac1b7c6591da0753052e1eccfb58')

relative_path "#{name}-#{version}"

dependency 'pkg-config'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)
  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
  copy("#{install_dir}/embedded/share/pkgconfig/xtrans.pc",
       "#{install_dir}/embedded/lib/pkgconfig/xtrans.pc")
end

name 'util-macros'
default_version '1.19.0'

source(url: "http://xorg.freedesktop.org/releases/individual/util/util-macros-#{version}.tar.bz2",
       md5: '1cf984125e75f8204938d998a8b6c1e1')

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
  copy("#{install_dir}/embedded/share/pkgconfig/xorg-macros.pc",
       "#{install_dir}/embedded/lib/pkgconfig/xorg-macros.pc")
end

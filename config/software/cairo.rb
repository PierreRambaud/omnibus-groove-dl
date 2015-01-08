name 'cairo'

default_version '1.12.14'

source url: "http://cairographics.org/releases/cairo-#{version}.tar.xz",
       md5: '27b634113d0f52152d60ae8e2ec7daa7'

relative_path "#{name}-#{version}"

dependency 'glib'
dependency 'atk'
dependency 'libxcb'
dependency 'libpng'
dependency 'pixman'
dependency 'gobject-introspection'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--enable-gobject=yes'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

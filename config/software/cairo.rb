name 'cairo'

default_version '1.14.0'

source url: "http://cairographics.org/releases/cairo-#{version}.tar.xz",
       md5: 'fc3a5edeba703f906f2241b394f0cced'

relative_path "#{name}-#{version}"

dependency 'fontconfig'
dependency 'freetype'
dependency 'glib'
dependency 'atk'
dependency 'libpng'
dependency 'pixman'
dependency 'gobject-introspection'
dependency 'libX11'
dependency 'libXrender'
dependency 'libXext'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--enable-gobject=yes',
         '--enable-freetype=yes',
         '--enable-fontconfig=yes'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

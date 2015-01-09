name 'libXcomposite'
default_version '0.4.4'

source(url: "http://xorg.freedesktop.org/releases/individual/lib/#{name}-#{version}.tar.gz",
       md5: 'af860b1554a423735d831e6f29ac1ef5')

relative_path "#{name}-#{version}"

dependency 'compositeproto'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

name 'harfbuzz'

default_version '0.9.37'

source(url: "http://www.freedesktop.org/software/#{name}/release/#{name}-#{version}.tar.bz2",
       md5: 'bfe733250e34629a188d82e3b971bc1e')

dependency 'pkg-config'

relative_path "#{name}-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

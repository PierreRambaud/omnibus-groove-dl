name 'xorg-sgml-doctools'
default_version '1.11'

source(url: "http://xorg.freedesktop.org/releases/individual/doc/#{name}-#{version}.tar.gz",
       md5: '51cf4c6b476e2b98a068fea6975b9b21')

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

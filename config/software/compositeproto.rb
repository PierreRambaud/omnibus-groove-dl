name 'compositeproto'
default_version '0.4'

source(url: "http://xorg.freedesktop.org/releases/individual/proto/#{name}-#{version}.tar.gz",
       md5: '33a79f6ba950bc5b41e077c951871bd5')

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

name 'libogg'

default_version '1.3.2'

source url: "http://downloads.xiph.org/releases/ogg/#{name}-#{version}.tar.gz",
       md5: 'b72e1a1dbadff3248e4ed62a4177e937'

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

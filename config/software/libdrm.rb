name 'libdrm'
default_version '2.4.58'

source(url: "http://dri.freedesktop.org/#{name}/#{name}-#{version}.tar.gz",
       md5: 'e56c0c79f7b17f761b0287b25b500cce')

relative_path "#{name}-#{version}"

dependency 'libpciaccess'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

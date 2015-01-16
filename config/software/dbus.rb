name 'dbus'
default_version '1.9.6'

source(url: "http://#{name}.freedesktop.org/releases/#{name}/#{name}-#{version}.tar.gz",
       md5: '5c64a166c72c50765d9c9cfbc696fac9')

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

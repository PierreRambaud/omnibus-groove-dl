name 'pixman'
default_version '0.32.4'

source(url: "http://cairographics.org/releases/pixman-#{version}.tar.gz",
       md5: 'eba449138b972fbf4547a8c152fea162')

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

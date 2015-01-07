name 'fontconfig'

default_version '2.11.91'

source(url: "http://www.freedesktop.org/software/fontconfig/release/fontconfig-#{version}.tar.gz",
       md5: 'aa5364ab1c5038b2585451e356995083')

relative_path "#{name}-#{version}"

dependency 'libexpat'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

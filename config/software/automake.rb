name 'automake'
default_version '1.14.1'

dependency 'autoconf'

source url: "http://ftp.gnu.org/gnu/automake/automake-#{version}.tar.gz",
       md5: 'd052a3e884631b9c7892f2efce542d75'

relative_path "automake-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  command(cmd, env: env)

  make("-j #{workers}", env: env)
  make('install', env: env)
end

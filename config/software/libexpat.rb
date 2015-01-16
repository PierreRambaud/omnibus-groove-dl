name 'libexpat'

default_version '1.95.8'

source(url: "http://downloads.sourceforge.net/expat/expat-#{version}.tar.gz",
       md5: 'aff487543845a82fe262e6e2922b4c8e')

relative_path "expat-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
  copy("#{install_dir}/embedded/lib/libexpat.so", "#{install_dir}/embedded/lib/libexpat.so.1")
end

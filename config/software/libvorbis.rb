name 'libvorbis'

default_version '1.3.4'

source url: "http://downloads.xiph.org/releases/vorbis/#{name}-#{version}.tar.gz",
       md5: '8851c593a52d1ef9c526d95174873852'

relative_path "#{name}-#{version}"

dependency 'libogg'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--disable-oggtest'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

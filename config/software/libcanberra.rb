name 'libcanberra'

default_version '0.30'

source url: "http://0pointer.de/lennart/projects/#{name}/#{name}-#{version}.tar.xz",
       md5: '34cb7e4430afaf6f447c4ebdb9b42072'

relative_path "#{name}-#{version}"

dependency 'libvorbis'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--disable-libtool-lock',
         '--disable-lynx'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

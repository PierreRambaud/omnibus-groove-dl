name 'libepoxy'

default_version '1.2'

source(url: "https://github.com/anholt/#{name}/archive/v#{version}.tar.gz",
       md5: '12d6b7621f086c0c928887c27d90bc30')

dependency 'pkg-config'
dependency 'automake'
dependency 'mesa'

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command('./autogen.sh', env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

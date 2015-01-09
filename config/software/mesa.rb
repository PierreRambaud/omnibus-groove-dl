name 'mesa'
default_version '10.4.1'

source(url: "ftp://ftp.freedesktop.org/pub/mesa/#{version}/MesaLib-#{version}.tar.gz",
       md5: '3d5331573da987e02b92af8bc96c678b')

relative_path "Mesa-#{version}"

dependency 'pkg-config'
dependency 'glproto'
dependency 'libdrm'
dependency 'dri2proto'
dependency 'dri3proto'
dependency 'presentproto'
dependency 'libXdamage'
dependency 'libxshmfence'
dependency 'libomxil-bellagio'

build do
  cmd = ['./configure',
         "--prefix=/usr",
         '--enable-sysfs'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)
  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

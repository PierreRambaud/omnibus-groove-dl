name 'mesa'
default_version '10.4.1'

source(url: "ftp://ftp.freedesktop.org/pub/mesa/#{version}/MesaLib-#{version}.tar.gz",
       md5: '3d5331573da987e02b92af8bc96c678b')

relative_path "Mesa-#{version}"

dependency 'automake'
dependency 'pkg-config'
dependency 'glproto'
dependency 'libdrm'
dependency 'presentproto'
dependency 'libXdamage'
dependency 'libxshmfence'

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded",
         '--enable-gles2',
         '--enable-gles1',
         '--disable-glx',
         '--enable-egl',
         '--enable-glx-tls',
         '--enable-gallium-egl',
         '--disable-dri',
         '--with-gallium-drivers=nouveau,svga,swrast'
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)
  command("#{install_dir}/embedded/bin/libtoolize --force")
  command(cmd, env: env)
  make("-j #{workers}", env: env)
  make('install', env: env)
end

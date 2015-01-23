name 'atk'

default_version '2.15.3'

source url: "http://ftp.gnome.org/pub/gnome/sources/#{name}/#{version.gsub(/\.(\d+)$/, '')}/#{name}-#{version}.tar.xz",
       md5: '4dc8f00682eeb6bcab3b9b2fd1f2378c'

relative_path "#{name}-#{version}"

build do
  cmd = ['./configure',
         "--prefix=#{install_dir}/embedded"
        ].join(' ')

  env = with_standard_compiler_flags(with_embedded_path)

  command(cmd, env: env)
  if rhel? && _64_bit?
    # Because rhel based system always tried to search libffi in lib64 instead
    # of lib directory
    link("#{install_dir}/embedded/lib", "#{install_dir}/embedded/lib64")
  end

  make("-j #{workers}", env: env)
  make('install', env: env)
end

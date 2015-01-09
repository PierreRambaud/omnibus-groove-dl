name 'groove-dl'

default_version '0.1.0'

source git: 'https://github.com/PierreRambaud/groove-dl.git'

relative_path 'groove-dl'

if windows?
  dependency 'ruby-windows'
  dependency 'openssl-windows'
else
  dependency 'ruby'
end

dependency 'pkg-config'
dependency 'python'
dependency 'freetype'
dependency 'fontconfig'
dependency 'pcre'
dependency 'bundler'
dependency 'rubygems'
dependency 'nokogiri'
dependency 'cairo'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  if windows?
    {
      'tar.exe' => 'bsdtar.exe',
      'libarchive-2.dll' => 'libarchive-2.dll',
      'libexpat-1.dll' => 'libexpat-1.dll',
      'liblzma-1.dll' => 'liblzma-1.dll',
      'libbz2-2.dll' => 'libbz2-2.dll',
      'libz-1.dll' => 'libz-1.dll'
    }.each do |target, to|
      copy("#{install_dir}/embedded/mingw/bin/#{to}",
           "#{install_dir}/bin/#{target}")
    end

    gem 'build groove-dl-x86-mingw32.gemspec', env: env
    gem 'install groove-dl*mingw32.gem  --no-ri --no-rdoc --verbose', env: env
    bundle 'install --without server docgen', env: env
    block 'Build Event Log Dll' do
      Dir.chdir software.project_dir do
        rake = windows_safe_path("#{install_dir}/embedded/bin/rake")
        command("#{rake} -rdevkit build_eventlog") if File.exist?
        "#{software.project_dir}/ext/win32-eventlog"
      end
    end
  else
    bundle 'install --without server docgen', env: env
    gem 'build groove-dl.gemspec', env: env
    gem 'install groove*.gem --no-ri --no-rdoc', env: env
  end

  delete "#{install_dir}/embedded/docs"
  delete "#{install_dir}/embedded/share/man"
  delete "#{install_dir}/embedded/share/doc"
  delete "#{install_dir}/embedded/share/gtk-doc"
  delete "#{install_dir}/embedded/ssl/man"
  delete "#{install_dir}/embedded/man"
  delete "#{install_dir}/embedded/info"
end

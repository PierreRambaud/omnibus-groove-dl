name 'perl-xml-parser'

default_version '2.44'

source url: "http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/XML-Parser-#{version}.tar.gz",
       md5: 'af4813fe3952362451201ced6fbce379'

relative_path "XML-Parser-#{version}"

dependency 'perl'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  env = env.merge('INSTALL_BASE' => "#{install_dir}/embedded")
  command("#{install_dir}/embedded/bin/perl Makefile.PL EXPATLIBPATH=#{install_dir}/embedded/lib EXPATINCPATH=#{install_dir}/embedded/include", env: env)
  make(env: env)
  make('install', env: env)
end

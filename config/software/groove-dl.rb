# This is an example software definition for a Ruby project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "groove-dl"
default_version "0.1.0"

dependency "ruby"
dependency "rubygems"
dependency "bundler"

source :git => "git://github.com/PierreRambaud/groove-dl.git"

relative_path "groove-dl"

build do
  bundle "install --path=#{install_dir}/embedded/service/gem"
  command "mkdir -p #{install_dir}/embedded/service/groove-dl"
  command "#{install_dir}/embedded/bin/rsync -a --delete --exclude=.git/*** --exclude=.gitignore ./ #{install_dir}/embedded/service/groove-dl/"
end

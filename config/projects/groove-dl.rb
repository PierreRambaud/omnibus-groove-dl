
name 'groove-dl'
maintainer 'Pierre Rambaud'
homepage 'https://github.com/PierreRambaud'

build_version   '0.1.0'
build_iteration 1


if windows?
  # NOTE: Ruby DevKit fundamentally CANNOT be installed into "Program Files"
  # Native gems will use gcc which will barf on files with spaces,
  # which is only fixable if everyone in the world fixes their Makefiles
  install_dir "#{default_root}/opscode/#{name}"
  package_name "groove-dl"
else
  install_dir "#{default_root}/#{name}"
end

dependency "preparation"
dependency "version-manifest"
dependency "groove-dl"

exclude '\.git*'
exclude 'bundler\/git'

package :msi do
  upgrade_code '140e8f3f-854a-4a2d-a073-6d22e75fdb28'
end

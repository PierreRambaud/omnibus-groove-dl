
name 'groove-dl'
maintainer 'Pierre Rambaud'
homepage 'https://github.com/PierreRambaud'

build_version '0.1.0'
build_iteration 1

# Defaults to C:/groove-dl on Windows
# and /opt/groove-dl on all other platforms
install_dir "#{default_root}/#{name}"

package_name 'groove-dl' if windows?

dependency 'preparation'
dependency 'version-manifest'
dependency 'groove-dl'

exclude '**/.git'
exclude '**/bundler/git'

package :msi do
  upgrade_code '140e8f3f-854a-4a2d-a073-6d22e75fdb28'
end

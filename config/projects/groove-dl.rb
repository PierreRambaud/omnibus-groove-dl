
name 'groove-dl'
maintainer 'CHANGE ME'
homepage 'https://CHANGE-ME.com'

install_dir     '/opt/groove-dl'
build_version   Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# groove-dl dependencies/components
# dependency 'somedep'

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'

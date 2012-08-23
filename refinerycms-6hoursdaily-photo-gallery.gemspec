# Encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'refinery/photo_gallery/version'

# version = Refinery::PhotoGallery::Version.to_s
# version = '0.1'

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-photo-gallery}
  s.version           = Refinery::PhotoGallery::Version.to_s
  s.platform          = Gem::Platform::RUBY
  # s.version           = version
  s.description       = %q{Forked and modified photo gallery engine from Martin Markech designed for integration with Refinery CMS.}
  s.summary           = %q{Ruby on Rails photo gallery engine for Refinery CMS.}
  s.email             = %q{jerrypascua@gmail.com}
  s.homepage          = %q{http://github.com/6hoursdaily/refinerycms-photo-gallery}
  s.authors           = ['6hoursdaily']
  s.require_paths     = %w(lib)

  # s.rubyforge_project = "refinerycms-photo-gallery"

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")
  s.require_paths   = ["lib"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 2.0.3'
  s.add_dependency    'refinerycms-settings', '~> 2.0.1'
  s.add_dependency    'refinerycms',          '~> 2.0.3'
  s.add_dependency    'mime-types'
  s.add_dependency    'carrierwave',          '0.6.2'
  s.add_dependency    'mini_magick'
  s.add_dependency    'mini_exiftool'
  s.add_dependency    'fog',                  '1.3.1'

  # Development dependencies
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.0'
end

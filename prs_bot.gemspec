$:.push File.expand_path("../lib", __FILE__)

require "prs_bot/version"

Gem::Specification.new do |s|
  s.name          = %q{prs_bot}
  s.version       = PrsBot::VERSION
  s.authors       = ["an-lee"]
  s.email         = ["an.lee.work@gmail.com"]
  s.homepage      = "https://github.com/an-lee/prs_bot"
  s.summary       = "An Unofficial SDK of PressOne"
  s.description   = "An Unofficial SDK of PressOne"
  s.license       = "MIT"
  s.files         = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE"]
  s.require_paths = ["lib"]
  s.executables   = ['setup']

  s.add_dependency('http')
  s.add_dependency('schmooze')
  s.add_dependency('activesupport')
end

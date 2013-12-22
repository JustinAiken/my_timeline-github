$:.push File.expand_path("../lib", __FILE__)

require "my_timeline/github/version"

Gem::Specification.new do |s|
  s.name        = "my_timeline-github"
  s.version     = MyTimeline::Github::VERSION
  s.authors     = ["Justin Aiken"]
  s.email       = ["60tonangel@gmail.com"]
  s.homepage    = "https://www.github.com/JustinAiken/my_timeline-github"
  s.summary     = "Github plugin for MyTimeline"
  s.description = "Github plugin for MyTimeline"
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")

  s.add_runtime_dependency "my_timeline"
  s.add_runtime_dependency "octokit"
end

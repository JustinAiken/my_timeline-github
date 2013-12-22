require 'octokit'

require "my_timeline"
require "my_timeline/github/engine"

module MyTimeline
  module Github

    mattr_accessor :client_id, :client_secret

    def self.setup
      yield self
    end
  end
end

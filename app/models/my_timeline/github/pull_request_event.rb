module MyTimeline
  module Github
    class PullRequestEvent < ActiveRecord::Base
      self.table_name = :my_timeline_github_pull_request_events
      belongs_to :event #,dependant: :destroy

      attr_protected unless rails4?
    end
  end
end

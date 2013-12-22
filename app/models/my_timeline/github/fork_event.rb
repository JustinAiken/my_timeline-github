module MyTimeline
  module Github
    class ForkEvent < ActiveRecord::Base
      self.table_name = :my_timeline_github_fork_events
      belongs_to :event #,dependant: :destroy

      attr_protected
    end
  end
end

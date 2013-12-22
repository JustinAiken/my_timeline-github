module MyTimeline
  module Github
    class GithubBuilder

      attr_reader :user, :github_event

      def initialize(user, github_event)
        @user         = user
        @github_event = github_event
      end

      def build_event
        #Children should define this!
      end

    private

      def already_exists_in_db?
        event = MyTimeline::Event.find_by_original_id(github_event.id)
        event && event.icon_name =~ /github/
      end

      def link_user_repo(user_repo)
        "<a href=https://www.github.com/#{user_repo}>#{user_repo}</a>"
      end
    end
  end
end

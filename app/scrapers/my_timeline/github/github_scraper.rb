module MyTimeline
  module Github
    class GithubScraper

      # ALL VALID GITHUB API EVENTS:
      #   CommitCommentEvent CreateEvent      DeleteEvent DownloadEvent     FollowEvent ForkEvent
      #   ForkApplyEvent     GistEvent        GollumEvent IssueCommentEvent IssuesEvent MemberEvent
      #   PublicEvent        PullRequestEvent PullRequestReviewCommentEvent PushEvent   ReleaseEvent
      #   StatusEvent        TeamAddEvent     WatchEvent

      # IMPLEMENTED EVENTS ONLY:
      VALID_EVENTS = %w{ForkEvent PullRequestEvent}.freeze

      attr_accessor :user

      def initialize(user)
        @user = user
      end

      def scrape
        @count = 0

        events.each do |event|
          if should_build? event
            Rails.logger.fatal "buidling #{event.type}"
            @count = @count + 1 if "MyTimeline::Github::#{event.type}Builder".constantize.new(user, event).build_event
          end
        end

        @count
      end

    private

      def events
        [].tap do |big_array|
          while items_on_current_page? do
            big_array << @current_page
          end
        end.flatten
      end

      def items_on_current_page?
        @current_page = github.user_public_events(username, page: page_number)
        @current_page.length > 0
      end

      def page_number
        @page_number ||= 0
        @page_number = @page_number + 1
      end

      def username
        user.settings(:github).user_name
      end

      def github
        @github ||= Octokit::Client.new(
          client_id:      MyTimeline::Github.client_id,
          client_secret:  MyTimeline::Github.client_secret,
          auto_traversal: true
        )
      end

      def should_build?(event)
        VALID_EVENTS.include?(event.type) &&
        user #TODO - @user has this option set??
      end
    end
  end
end

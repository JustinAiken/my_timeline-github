module MyTimeline
  module Github
    class PullRequestEventBuilder < GithubBuilder

      def build_event
        return false if already_exists_in_db?

        event = MyTimeline::Event.create(
          happened_on:   github_event.created_at,
          original_id:   github_event.id,
          external_link: github_event.payload.pull_request.rels[:html].href,
          icon_name:     "github.png",
          importance:    5,
          public:        1,
          description:   "#{github_event.payload.action.capitalize} Pull Request #{link_pr} on #{link_user_repo(github_event.repo.name)}: #{github_event.payload.pull_request.title}"
        )

        pull_request_event = MyTimeline::Github::PullRequestEvent.new(
          happened_on:   github_event.created_at,
          title:         github_event.payload.pull_request.title,
          body:          github_event.payload.pull_request.body,
          url:           github_event.payload.pull_request.rels[:html].href,
          commits:       github_event.payload.pull_request.commits,
          additions:     github_event.payload.pull_request.additions,
          deletions:     github_event.payload.pull_request.deletions,
          changed_files: github_event.payload.pull_request.changed_files,
          repo:          github_event.repo.name
        )

        event.linkable = pull_request_event
        event.user = user if MyTimeline.user_class
        event.save

        pull_request_event.event = event
        pull_request_event.save
      end

    private

      def link_pr
        "<a href=#{github_event.payload.pull_request.rels[:html].href}>##{github_event.payload.number}</a>"
      end
    end
  end
end

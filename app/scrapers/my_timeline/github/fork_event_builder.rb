module MyTimeline
  module Github
    class ForkEventBuilder < GithubBuilder

      def build_event
        return false if already_exists_in_db?

        event = MyTimeline::Event.create(
          happened_on:   github_event.created_at,
          original_id:   github_event.id,
          external_link: "https://www.github.com/#{user.settings(:github).user_name}/#{github_event.repo.name}",
          icon_name:     "github.png",
          importance:    5,
          public:        1,
          description:   "Forked #{link_user_repo(github_event.repo.name)}"
        )

        fork_event = MyTimeline::Github::ForkEvent.new(
         happened_on: github_event.created_at,
         original_id: github_event.id,
         repo:        github_event.repo.name
        )

        event.linkable = fork_event
        event.user = user if MyTimeline.user_class
        event.save

        fork_event.event = event
        fork_event.save
      end
    end
  end
end

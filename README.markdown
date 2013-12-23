# My Timeline - Github Plugin [![Code Climate](https://codeclimate.com/github/JustinAiken/my_timeline-github.png)](https://codeclimate.com/github/JustinAiken/my_timeline-github)
#### Github Integration with My Timeline

## Requirements:

- [My Timeline](https://github.com/JustinAiken/my_timeline)
- [Octokit](https://github.com/octokit/octokit.rb) gem

## Usage:

1. Add this gem to your Gemfile:
`gem 'my_timeline-github'` and `bundle install`
2. [Register your application](https://github.com/settings/applications/new) with Github to get `client_id` and `client_secret` keys.
3. Edit `config/initializers/my_timeline.rb` to include your Github OAUTH keys:

```ruby
MyTimeline.setup do |config|
  ...
end

...

MyTimeline::Github.setup do |config|
  config.client_id     = "YOURKEY"
  config.client_secret = "YOURKEY"
end

```

## Current State

Github provides a wide variety of user activities.  This plugin will eventually include them all, but they'll be coming one at a time...

`[ ]` [CommitCommentEvent](http://developer.github.com/v3/activity/events/types/#commitcommentevent) <br>
`[ ]` [CreateEvent](http://developer.github.com/v3/activity/events/types/#createevent) <br>
`[ ]` [DeleteEvent](http://developer.github.com/v3/activity/events/types/#deleteevent) <br>
`[ ]` [DownloadEvent](http://developer.github.com/v3/activity/events/types/#downloadevent) <br>
`[ ]` [FollowEvent](http://developer.github.com/v3/activity/events/types/#followevent) <br>
`[x]` [ForkEvent](http://developer.github.com/v3/activity/events/types/#forkevent) <br>
`[ ]` [ForkApplyEvent](http://developer.github.com/v3/activity/events/types/#forkapplyevent) <br>
`[ ]` [GistEvent](http://developer.github.com/v3/activity/events/types/#gistevent) <br>
`[ ]` [GollumEvent](http://developer.github.com/v3/activity/events/types/#gollumevent) <br>
`[ ]` [IssueCommentEvent](http://developer.github.com/v3/activity/events/types/#issuecommentevent) <br>
`[ ]` [IssuesEvent](http://developer.github.com/v3/activity/events/types/#issuesevent) <br>
`[ ]` [MemberEvent](http://developer.github.com/v3/activity/events/types/#memberevent) <br>
`[ ]` [PublicEvent](http://developer.github.com/v3/activity/events/types/#publicevent) <br>
`[ ]` [PullRequestEvent](http://developer.github.com/v3/activity/events/types/#pullrequestevent) <br>
`[ ]` [PullRequestReviewCommentEvent](http://developer.github.com/v3/activity/events/types/#pullrequestreviewcommentevent) <br>
`[ ]` [PushEvent](http://developer.github.com/v3/activity/events/types/#pushevent) <br>
`[ ]` [ReleaseEvent](http://developer.github.com/v3/activity/events/types/#releaseevent) <br>
`[ ]` [StatusEvent](http://developer.github.com/v3/activity/events/types/#statusevent) <br>
`[ ]` [TeamAddEvent](http://developer.github.com/v3/activity/events/types/#teamaddevent) <br>
`[ ]` [WatchEvent](http://developer.github.com/v3/activity/events/types/#watchevent)

## Credits

Original author: [Justin Aiken](https://github.com/JustinAiken)

## Links

* [Source](https://github.com/JustinAiken/my_timeline-github)
* [Bug Tracker](https://github.com/JustinAiken/my_timeline-github/issues)
* [Rubygem](https://rubygems.org/gems/my_timeline-github)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 Justin Aiken Inc. MIT license (see LICENSE for details).

namespace "my_timeline-twitter" do
  namespace :install do
    desc "Copy migrations from my_timeline-twitter to application"
    task :migrations do
      timestamp = Time.now.strftime("%Y%m%d%H%M%S")

      source    = File.expand_path "../../../../db/migrate//db/migrate/20131222224040_create_github_fork_events.rb", File.dirname(__FILE__)
      dest      = File.expand_path "db/migrate/#{timestamp}_create_github_fork_events.my_timeline.rb"
      puts "cp #{source} #{dest}"
      `cp #{source} #{dest}`
    end
  end
end

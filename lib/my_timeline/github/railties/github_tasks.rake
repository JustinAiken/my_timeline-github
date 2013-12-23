namespace "my_timeline-github" do

  def already_copied?(migration_file)
    `ls db/migrate/*#{migration_file}.my_timeline.rb` != ""
  end

  def copy_migration(migration_file)
    return if already_copied? migration_file
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    source    = File.expand_path "../../../../db/migrate/#{migration_file}.rb", File.dirname(__FILE__)
    dest      = File.expand_path "db/migrate/#{timestamp}_#{migration_file}.my_timeline.rb"
    puts "cp #{source} #{dest}"
    `cp #{source} #{dest}`
  end

  namespace :install do
    desc "Copy migrations from my_timeline-github to application"
    task :migrations do
      copy_migration "create_github_fork_events"
      copy_migration "create_github_pull_request_events"
    end
  end
end

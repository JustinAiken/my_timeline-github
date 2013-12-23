class CreateGithubPullRequestEvents < ActiveRecord::Migration
  def change
    create_table :my_timeline_github_pull_request_events do |t|
      t.datetime :happened_on

      t.text    :title
      t.text    :body
      t.string  :url
      t.integer :commits
      t.integer :additions
      t.integer :deletions
      t.integer :changed_files
      t.string  :repo

      t.references :event
      t.timestamps
    end
  end
end

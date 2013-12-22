class CreateGithubForkEvents < ActiveRecord::Migration
  def change
    create_table :my_timeline_github_fork_events do |t|
      t.datetime :happened_on

      t.string :original_id
      t.string :repo

      t.references :event
      t.timestamps
    end
  end
end

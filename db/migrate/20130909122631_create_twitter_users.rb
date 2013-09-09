class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username
      t.datetime :cache_time
      t.float :refresh_time

      t.timestamps
    end
  end
end

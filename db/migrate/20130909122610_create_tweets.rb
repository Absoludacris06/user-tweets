class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.datetime :created_at
      t.belongs_to :twitter_user

    end
  end
end

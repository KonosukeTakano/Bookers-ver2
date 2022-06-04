class AddNicknameToRelationships < ActiveRecord::Migration[6.1]
  def change
    # create_table :relationships do |t|
      add_reference :relationships, :followed, foreign_key: { to_table: :users }
      add_reference :relationships, :follower, foreign_key: { to_table: :users }
      add_timestamps(:relationships)
      add_index [:follower_id, :followed_id], unique: true
    # end
  end
end

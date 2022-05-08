class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body # 変更用のマイグレーションファイルで string => text へ変更
      t.integer :user_id

      t.timestamps
    end
  end
end

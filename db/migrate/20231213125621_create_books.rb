class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      
      # Bookモデルのテーブル設計：不安
      # t.string :user_name
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end

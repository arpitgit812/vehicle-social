class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :integer, force: :cascade do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end

class CreateUris < ActiveRecord::Migration
  def change
    create_table :uris do |t|
      t.string :original_uri
      t.string :short_uri
      t.integer :click_count, default:0
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

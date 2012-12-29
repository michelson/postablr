class CreatePostablrEntries < ActiveRecord::Migration
  def change
    create_table :postablr_entries do |t|
      t.integer :user_id
      t.integer :postable_id
      t.string :postable_type
      t.boolean :comments_enabled
      t.boolean :highlight
      t.string :slug
      t.string :content_source
      t.boolean :is_published
      t.datetime :publish_at
      t.datetime :unpublish_at

      t.timestamps
    end
  end
end

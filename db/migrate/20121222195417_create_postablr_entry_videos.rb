class CreatePostablrEntryVideos < ActiveRecord::Migration
  def change
    create_table :postablr_entry_videos do |t|
      t.string :title
      t.string :thumbnail
      t.string :embed_url
      t.text :embed_html
      t.string :flv
      t.string :download_url
      t.string :service
      t.integer :duration
      t.text :caption
      t.timestamps
    end
  end
end

class CreatePostablrEntryQuotes < ActiveRecord::Migration
  def change
    create_table :postablr_entry_quotes do |t|
      t.text :body
      t.string :source

      t.timestamps
    end
  end
end
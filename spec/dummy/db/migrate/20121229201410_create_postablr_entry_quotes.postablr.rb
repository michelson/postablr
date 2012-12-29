# This migration comes from postablr (originally 20121222200141)
class CreatePostablrEntryQuotes < ActiveRecord::Migration
  def change
    create_table :postablr_entry_quotes do |t|
      t.text :body
      t.string :source

      t.timestamps
    end
  end
end

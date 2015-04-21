class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.belongs_to :author
      t.timestamps
    end
  end
end

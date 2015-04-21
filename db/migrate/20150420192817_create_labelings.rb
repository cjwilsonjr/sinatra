class CreateLabelings < ActiveRecord::Migration
  def change
    create_table :labelings do |t|
      t.belongs_to :entry
      t.belongs_to :tag
    end
  end
end

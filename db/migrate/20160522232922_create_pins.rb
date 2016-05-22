class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :user, index: true, foreign_key: true
      t.text :url
      t.string :title

      t.timestamps null: false
    end
  end
end

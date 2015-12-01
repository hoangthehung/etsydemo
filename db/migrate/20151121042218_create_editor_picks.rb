class CreateEditorPicks < ActiveRecord::Migration
  def change
    create_table :editor_picks do |t|
      t.string :name
      t.string :image
      t.boolean :onTop
      t.text :description

      t.timestamps null: false
    end
  end
end

class CreateWikis < ActiveRecord::Migration[5.0]
  def change
    create_table :wikis do |t|
      t.string :name
      t.string :logo_url
      t.string :site_type
      t.string :editor
      t.string :owner
      t.string :url
      t.integer :founded
      t.string :created

      t.index :name
      t.timestamps
    end
  end
end

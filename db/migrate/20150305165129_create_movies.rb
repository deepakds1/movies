class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name

      t.string :realese

      t.string :actor

      t.string :director

      t.integer :rating

      t.timestamps null: false
    end
  end
end

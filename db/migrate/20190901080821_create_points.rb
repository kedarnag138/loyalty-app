class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :earned
      t.string :location

      t.timestamps
    end
  end
end
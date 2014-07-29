class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :role
      t.integer :location_id
      t.integer :person_id

      t.timestamps
    end
  end
end

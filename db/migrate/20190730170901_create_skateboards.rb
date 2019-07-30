class CreateSkateboards < ActiveRecord::Migration[5.2]
  def change
    create_table :skateboards do |t|
      t.string :design
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end

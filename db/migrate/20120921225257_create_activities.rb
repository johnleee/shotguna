class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :activity_type_id
      t.string :name
      t.datetime :date
      t.integer :distance
      t.integer :time
      t.integer :user_id

      t.timestamps
    end
    add_index :activities, [:user_id, :created_at]
  end
end

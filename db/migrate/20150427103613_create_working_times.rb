class CreateWorkingTimes < ActiveRecord::Migration
  def change
    create_table :working_times do |t|
      t.float :time
      t.date :date
      t.boolean :approval, default: false
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :working_times, [:user_id, :project_id]
    add_index :working_times, [:user_id, :project_id, :date], unique: true
  end
end
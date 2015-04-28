class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :project_id
      t.float   :assain_rate
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end

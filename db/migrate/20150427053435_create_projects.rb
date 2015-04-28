class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end

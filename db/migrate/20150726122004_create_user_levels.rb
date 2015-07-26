class CreateUserLevels < ActiveRecord::Migration
  def change
    create_table :user_levels do |t|
      t.string :level
      t.boolean :is_admin

      t.timestamps
    end
  end
end

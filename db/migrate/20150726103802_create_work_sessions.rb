class CreateWorkSessions < ActiveRecord::Migration
  def change
    create_table :work_sessions do |t|
      t.datetime :start
      t.datetime :end
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end

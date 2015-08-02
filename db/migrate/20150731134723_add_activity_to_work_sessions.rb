class AddActivityToWorkSessions < ActiveRecord::Migration
  def change
    add_column :work_sessions, :activity, :string
  end
end

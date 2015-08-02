class AddColorToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :color, :string, :default => "#C3435C", :null => false
  end
end

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

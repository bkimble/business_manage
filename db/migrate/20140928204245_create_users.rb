class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :is_manager, :default => false
      t.integer :manager_id
      t.timestamps
    end
  end
end

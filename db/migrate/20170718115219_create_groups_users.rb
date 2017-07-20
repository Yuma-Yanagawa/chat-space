class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users do |t|
      t.references :group
      t.references :user
      t.timestamps
    end
  end
end

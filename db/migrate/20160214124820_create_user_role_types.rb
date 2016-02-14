class CreateUserRoleTypes < ActiveRecord::Migration
  def change
    create_table :user_role_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class AddUserToMusicas < ActiveRecord::Migration
  def change
    add_column :musicas, :user_id, :integer
  end
end

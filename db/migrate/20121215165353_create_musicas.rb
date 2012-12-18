class CreateMusicas < ActiveRecord::Migration
  def change
    create_table :musicas do |t|
      t.string :nome
      t.string :autor

      t.timestamps
    end
  end
end

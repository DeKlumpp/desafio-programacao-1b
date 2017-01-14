class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :comprador
      t.string :descricao
      t.decimal :preco
      t.integer :quantidade
      t.string :endereco
      t.string :fornecedor

      t.timestamps null: false
    end
  end
end

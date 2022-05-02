class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.integer :codigo
      t.string :nombre
      t.string :descripcion
      t.integer :precio

      t.timestamps
    end
  end
end

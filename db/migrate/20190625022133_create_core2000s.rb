class CreateCore2000s < ActiveRecord::Migration[5.2]
  def change
    create_table :core2000s do |t|
      t.string :expression
      t.string :meaning
      t.string :reading
      t.string :audio
      t.string :image
      t.integer :iknowid
      t.string :iknowtype

      t.timestamps
    end
  end
end

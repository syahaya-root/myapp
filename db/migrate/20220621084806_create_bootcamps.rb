class CreateBootcamps < ActiveRecord::Migration[7.0]
  def change
    create_table :bootcamps do |t|
      t.string :name
      t.text :description
      t.string :dates

      t.timestamps
    end
  end
end

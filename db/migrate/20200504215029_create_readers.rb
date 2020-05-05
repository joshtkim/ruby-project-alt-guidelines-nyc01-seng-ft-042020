class CreateReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :readers do |x|
      x.string :name
      x.integer :age
    end
  end
end

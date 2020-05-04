class CreateWriters < ActiveRecord::Migration[5.2]
  def change
    create_table :writers do |x|
      x.string :name
      x.integer :years_of_experience
    end
  end
end

class CreateWebtoons < ActiveRecord::Migration[5.2]
  def change
    create_table :webtoons do |x|
      x.string :title
      x.integer :writer_id
      x.integer :reader_id
      x.string :release_day
    end
  end
end

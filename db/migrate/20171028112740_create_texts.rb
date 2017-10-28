class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :text
      t.string :number

      t.timestamps
    end
  end
end

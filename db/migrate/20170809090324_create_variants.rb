class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.belongs_to :question
      t.string :text
      t.boolean :is_answer
      t.timestamps
    end
  end
end

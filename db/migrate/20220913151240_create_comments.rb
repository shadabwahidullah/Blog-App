class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text

      t.timestamps
    end

    add_reference(:comments, :author, foreign_key:{to_table: :users}, index: true)
    add_reference(:comments, :post, index: true)
  end
end

class CreateQuotesReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes_reviews do |t|
      t.integer :rating, null: false
      t.string :ip_address, null: false
      t.references :quote, foreign_key: true, null: false

      t.timestamps
    end
  end
end

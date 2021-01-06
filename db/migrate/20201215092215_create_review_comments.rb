class CreateReviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :review_comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :date
      t.bigint :grade
      t.bigint :reply_to

      t.timestamps
    end
  end
end

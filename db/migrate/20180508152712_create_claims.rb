class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.timestamps
      t.string :content
      t.string :contact
      t.integer :user_id
      t.integer :subject_id
    end
  end
end

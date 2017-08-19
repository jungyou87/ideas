class CreateLikedBies < ActiveRecord::Migration
  def change
    create_table :liked_bies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
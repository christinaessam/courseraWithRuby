class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :content
      t.string :attachment
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end

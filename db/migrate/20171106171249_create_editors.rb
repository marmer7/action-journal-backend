class CreateEditors < ActiveRecord::Migration[5.1]
  def change
    create_table :editors do |t|
      t.string :raw_content_state
      t.integer :user_id

      t.timestamps
    end
  end
end

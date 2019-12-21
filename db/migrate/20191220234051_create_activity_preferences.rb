class CreateActivityPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_preferences do |t|
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

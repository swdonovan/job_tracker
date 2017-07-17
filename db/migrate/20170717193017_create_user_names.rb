class CreateUserNames < ActiveRecord::Migration[5.1]
  def change
    create_table :user_names do |t|
      t.string :name

      t.timestamps
    end
  end
end

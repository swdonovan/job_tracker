class CreateJobCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :job_categories do |t|
      t.references :job, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

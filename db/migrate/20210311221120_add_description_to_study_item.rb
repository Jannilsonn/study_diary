class AddDescriptionToStudyItem < ActiveRecord::Migration[6.1]
  def change
    add_column :study_items, :description, :string
  end
end

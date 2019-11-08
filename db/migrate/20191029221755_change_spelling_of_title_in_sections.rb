class ChangeSpellingOfTitleInSections < ActiveRecord::Migration[5.2]
  def change  
    rename_column :sections, :titile, :title
  end
end

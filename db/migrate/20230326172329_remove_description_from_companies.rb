class RemoveDescriptionFromCompanies < ActiveRecord::Migration[7.0]
  def change
    remove_column :companies, :description, :text
  end
end

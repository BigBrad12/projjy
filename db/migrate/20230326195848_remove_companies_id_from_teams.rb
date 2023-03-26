class RemoveCompaniesIdFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :companies_id, :bigint
  end
end

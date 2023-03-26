class AddAssociationsToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :companies, null: false, foreign_key: true
  end
end

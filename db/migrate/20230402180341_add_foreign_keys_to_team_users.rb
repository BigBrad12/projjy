class AddForeignKeysToTeamUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :team_users, :teams
    add_foreign_key :team_users, :users
  end
end

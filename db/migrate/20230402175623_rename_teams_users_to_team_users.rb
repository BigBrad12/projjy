class RenameTeamsUsersToTeamUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :teams_users, :team_users
  end
end

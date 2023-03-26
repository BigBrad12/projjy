class CreateTeamProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :team_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
ActiveAdmin.register Serie do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :active, :winner_team_id, :loser_win_games, :round, :mvp, :team_a_id, :team_b_id

  index do
    id_column
    column :name
    column :active
    column :winner_team
    column :loser_win_games
    column :round
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :round, as: :select, collection: {"Round 1" => "quarter", "Semis" => "semis", "Final de Conferencia" => "conference_finals", "The Finals" => "the_finals"}
      f.input :active
      f.input :team_a
      f.input :team_b
      f.input :winner_team
      f.input :loser_win_games
    end
    f.actions
  end

end

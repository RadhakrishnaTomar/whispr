ActiveAdmin.register Reaction do
  permit_params :confession_id, :reaction_type, :ip

  index do
    selectable_column
    id_column
    column :confession_id
    column :reaction_type do |reaction|
      case reaction.reaction_type
      when "like" then "❤️ Like"
      when "hug" then "🤗 Hug"
      when "laugh" then "😂 Laugh"
      else reaction.reaction_type
      end
    end
    column :ip
    column :created_at
    actions
  end

  filter :confession_id
  filter :reaction_type, as: :select, collection: [ "like", "hug", "laugh" ]
  filter :ip
  filter :created_at

  show do
    attributes_table do
      row :id
      row :confession_id
      row :reaction_type
      row :ip
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Reaction Details" do
      f.input :confession_id, as: :select, collection: Confession.pluck(:id, :body).map { |id, body| [body.truncate(50), id] }
      f.input :reaction_type, as: :select, collection: [ "like", "hug", "laugh" ]
      f.input :ip
    end
    f.actions
  end
end

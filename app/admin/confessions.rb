ActiveAdmin.register Confession do
  permit_params :body, :ip

  index do
    selectable_column
    id_column
    column :body do |confession|
      truncate(confession.body, length: 100)
    end
    column :ip
    column :created_at
    actions
  end

  filter :body, as: :string
  filter :ip
  filter :created_at

  show do
    attributes_table do
      row :id
      row :body
      row :ip
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "Edit Confession" do
      f.input :body
      f.input :ip
    end
    f.actions
  end
end

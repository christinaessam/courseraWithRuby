ActiveAdmin.register User do
  permit_params :birthdate , :img ,:gender ,:name, :email ,:password



  index do
    selectable_column
    id_column
    column :email
    column :birthdate
    column :img
    column :name
    column :gender
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :birthdate
      f.input :img
      f.input :gender
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

ActiveAdmin.register Pokemon do
  permit_params :name, :price, :height, :weight, :candy, :category_id
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :height
    column :weight
    column :candy
    column :category
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :height
      row :weight
      row :candy
      row :category
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :height
      f.input :weight
      f.input :candy
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
    end
    f.actions
  end
end



ActiveAdmin.register Category do

  permit_params :name

  config.filters = false

  controller do

    def index

      # Assuming you are using a model named Category

      # Paginate the collection using Kaminari (or other pagination gem)

      @categories = Category.page(params[:page]).per(10) # Adjust the number per page as needed




    end

  end




  index do

    selectable_column unless Category.count.zero?

    id_column

    column :name

    column :created_at

    actions

  end




  show do

    attributes_table do

      row :name

      row :created_at

      row :updated_at

    end

  end

end
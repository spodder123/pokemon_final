class ApplicationController < ActionController::Base
  before_action :find_categories

  def find_categories
    #@search_categories = Category.pluck:(:name)
    @categories= Category.all()
  end
end

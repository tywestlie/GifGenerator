class Admin::CategoriesController < Admin::BaseController

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to root_path
  end
end

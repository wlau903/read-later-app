class ArticlesController < ApplicationController
  before_action :require_login, except: :show
  before_action :set_article, only: [:show, :edit, :update]

  def show
    #@article.build_reading_list
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @article }
    end
  end

  def edit
    render :show
  end

  def update
    if params[:article][:reading_list_id] != ""
      reading_list = current_user.reading_lists.find_by(id: params[:article][:reading_list_id])
      reading_list.articles << @article
    elsif params[:article][:reading_list_attributes][:name] != nil || params[:article][:reading_list_attributes][:name] != ""
      reading_list = current_user.reading_lists.find_or_create_by(name: params[:article][:reading_list_attributes][:name])
      reading_list.articles << @article
    end

    if @article.save(article_params)
      redirect_to user_reading_list_path(current_user.id, reading_list.id)
    else
      render :show
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:reading_list_id, reading_list_attributes: [:id, :name, :user_id])
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to save"
      redirect_to new_user_session_path
    end
  end
end

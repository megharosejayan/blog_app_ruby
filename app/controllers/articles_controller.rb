class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :delete]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :delete]
    # comments below are the ones replaced with set_article

    def show
        #flash[:notice] = "Article showing"
        #@article = Article.find(params[:id])
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 2)
    end

    def new
            @article=Article.new
    end

    def edit
        #@article = Article.find(params[:id])
        if @article.errors.any?
            flash[:notice] = "Error."
        end
    end

    def create
        # previously (before article_params)
        # @article = Article.new(params.require(:article).permit(:title, :description))
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article was created successfully"
            redirect_to article_path(@article)
        else
            redirect_to :action => :new
        end
    end

    def update
        #@article = Article.find(params[:id])
        if @article.update(article_params)
          flash[:notice] = "Article was updated successfully."
          redirect_to @article
        else
            redirect_to :action => :edit
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        params[:id] = nil
        flash[:notice] = "Art has been deleted"
        redirect_to :action => :index
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "You can only edit your own article"
            redirect_to @article
        end
    end

end
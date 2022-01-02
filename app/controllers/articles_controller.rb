class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :delete]

    # comments below are the ones replaced with set_article

    def show
        #flash[:notice] = "Article showing"
        #@article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
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
        @article.user = User.first
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

end
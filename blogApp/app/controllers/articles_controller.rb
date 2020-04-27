class ArticlesController < ApplicationController
    # before_action :authenticate_user!, except: [:index, :show]
    before_action :authenticate_user! , except: [:index, :show]
    load_and_authorize_resource
    def new
        @article = Article.new
    end

    def create
        # authorize! :create, @article
        @article = Article.new(article_params)
        @article.user_id=current_user.id
       
        if @article.save
          redirect_to @article
        else
          render 'new'
        end
      end
    
    def edit
        @article =Article.find(params[:id])
    end

    def update
        @article =Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end

    end
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles= Article.all
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title,:text)
    end

    


    
end

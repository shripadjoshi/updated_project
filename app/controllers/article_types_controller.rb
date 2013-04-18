class ArticleTypesController < ApplicationController
  before_filter :authenticate_user!, :authorize_role
  
  def index
    @article_types = params[:search] ? ArticleType.search(params[:search], star: true).paginate(page: params[:page], per_page: 10) : ArticleType.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html 
      format.xls { send_data @article_types.to_xls, content_type: 'application/vnd.ms-excel', filename: 'article_types.xls' }
    end
  end

  def new
    @article_type = ArticleType.new
  end

  def create
    @article_type = ArticleType.new(params[:article_type])

    respond_to do |format|
      if @article_type.save
        format.html { redirect_to article_types_path, notice: 'Article Type was successfully created.' }
        format.json { render json: @article_type, status: :created, location: @article_type }
      else
        format.html { render action: "new" }
        format.json { render json: @article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article_type = ArticleType.find(params[:id])
  end

  def update
    @article_type = ArticleType.find(params[:id])

    respond_to do |format|
      if @article_type.update_attributes(params[:article_type])
        format.html { redirect_to article_types_path, notice: 'Article Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ######TODO need to write the condition for delete
    @article_type = ArticleType.find(params[:id])
    @article_type.destroy

    respond_to do |format|
      format.html { redirect_to article_types_url, notice: 'Article Type was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end

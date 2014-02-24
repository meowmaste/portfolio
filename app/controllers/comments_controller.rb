class CommentsController < ApplicationController
  before_action :set_comment, only: [:approve, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:create]
  before_action :load_commentable , only: [:create]

  def edit
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @commentable, notice: 'Comment could not be created. Sorry.' }
      end
    end
  end

  def approve
    authorize @comment, :approve?
    @comment.approve!
    redirect_to @comment.post, notice: 'Comment approved.' 
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was successfully updated.' }
      else
        format.html { redirect_to @comment.post, notice: 'Comment could not be updated.' }
      end
    end
  end

  def destroy
  	@post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :author, :author_url, :author_email)
    end

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
end

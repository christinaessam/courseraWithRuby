class CommentsController < InheritedResources::Base
  # before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :findlecture
  # after_action :redirectDelete , only:[:destroy]
  def create
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.create(comment_params)
    @comment.user_id = current_user.id #or whatever is you session name
    if @comment.save
      redirect_to @lecture
    else
      flash.now[:danger] = "error"
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to lecture_path(@comment.lecture_id), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end




  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to lecture_path(@comment.lecture_id), notice: 'comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

    def findlecture
      @lecture=Lecture.find(params[:lecture_id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :lecture_id)
    end

end


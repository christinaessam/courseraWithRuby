class LecturesController < InheritedResources::Base
  before_action :authenticate_user!,only: [:like, :dislike]
  def index
    @lectures = Lecture.all
    redirect_to courses_path
  end
  def create

    @lecture = Lecture.new(lecture_params)
    @lecture.user_id = current_user.id


    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'course was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end


  end
  def like
    @lecture = Lecture.find(params[:id])
    @lecture.upvote_from current_user
    redirect_to lecture_path
  end

  def dislike
    @lecture = Lecture.find(params[:id])
    @lecture.downvote_from current_user
    redirect_to lecture_path
  end
  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :user_id, :course_id)
    end
end


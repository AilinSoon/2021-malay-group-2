class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.status == "Started"
      @course.started_at = Time.zone.now
    end
    if @course.save
      flash[:success] = "Course successfully registered"
      redirect_to @course
    else
      flash[:danger] = "Course has failed to be registered!"
      render :new
    end
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by(id: params[:id])
    @user_course = UserCourse.new
    @review = Review.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  def update
    @course = Course.find(params[:id])
    if @course.status == "Started"
      @course.started_at = Time.zone.now
    end
    if @course.update(course_params)
      flash[:success] = "Course updated!"
      redirect_to @course
    else
      flash[:danger] = "Failed to update course!"
      redirect_to courses_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :total_month, :total_member, :status, :started_at)
  end

end

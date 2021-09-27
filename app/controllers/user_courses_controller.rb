class UserCoursesController < ApplicationController

  def index; end

  def new
    @user_course = UserCourse.new
  end

  def create
    @user = User.find_by(params[:id])
    @course = Course.find_by(params[:id])
    @user_course = UserCourse.new(usercourse_params)

    if @user_course.save
      flash[:info] = "Course is registered!"
      redirect_to current_user
    else
      flash[:danger] = "Please try again!"
      redirect_to courses_path
    end
  end

  def edit
    @pending = UserCourse.pending.find_by(params[:id])
    @approve = UserCourse.Approved.find_by(params[:id])
    @denied = UserCourse.Denied.find_by(params[:id])
  end

  def update
    @pending = UserCourse.Pending.find_by(params[:id])
    @approve = UserCourse.Approved.find_by(params[:id])
    @denied = UserCourse.Denied.find_by(params[:id])
    user_course = UserCourse.find_by(params[:id])
    if @pending.update(usercourse_params)
      if @pending.status == "Approved"
        flash[:info] = "Student's registsration is approved!!"
        redirect_to current_user
      elsif @pending.status == "Denied"
        flash[:info] = "Student's registration is denied!"
        redirect_to current_user
      else
        flash[:info] = "No changes  has been made!"
        redirect_to current_user
      end
    end
  end

  def destroy
    @user_course = UserCourse.find_by(params[:id])
    @user = User.find_by(params[:id])
    if @user_course.destroy
      flash[:info] = "Course registration is cancelled!"
      redirect_to current_user
    else
      flash[:danger] = "Please try again!"
      redirect_to current_user
    end
  end

  private

  def usercourse_params
    params.require(:user_course).permit(:user_id, :course_id, :status)
  end
end

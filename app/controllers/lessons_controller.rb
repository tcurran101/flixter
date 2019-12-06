class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_for_current_lesson, only: [:show]

  def show
  end

  private

  helper_method :current_lesson
    def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
    end

  def require_enrolled_for_current_lesson
    if current_user != current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: 'You must be enrolled in the course to view lessons.'
    end
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video)
  end

end
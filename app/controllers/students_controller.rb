class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    if @student.active == false
      @message = "This student is currently inactive."
    else
      @message = "This student is currently active."
    end    
  end

  def activate
    @student = Student.find(params[:id])
    if @student.active == false
      @student.active = true
    else
      @student.active = false
    end 
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
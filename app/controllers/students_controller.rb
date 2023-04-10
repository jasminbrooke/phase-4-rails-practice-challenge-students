class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find_by(id: params[:id])
        render json: student
    end

    def create
        student = Student.create(student_params)
        if student.valid?
            render json: student, status: :created
        else
            render json: {error: student.errors.full_message}, status: :unprocessable_entity
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        render json: :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end

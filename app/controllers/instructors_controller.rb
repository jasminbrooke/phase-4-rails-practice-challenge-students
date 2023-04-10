class InstructorsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create(instructor_params)
        if instructor.valid?
            render json: instructor, status: :created
        else
            render json: {errors: instructor.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        instructor.find_by(id: params[:id])
        instructor.destroy
    end


    private

    def instructor_params
        params.permit(:name)
    end

end

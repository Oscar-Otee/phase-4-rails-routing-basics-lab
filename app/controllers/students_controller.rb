class StudentsController < ApplicationController
    def index
        students = Student.all
        render json: students
    end

    def grades
        grades = Student.all.order(grade: :desc).map do |student|
          { first_name: student.first_name ,last_name: student.last_name, grade: student.grade }
        end
        render json: grades
    end
    
    def highest_grade
        student = Student.all.order(grade: :desc).first
        render json:  { first_name: student.first_name ,last_name: student.last_name, grade: student.grade }
    end
end

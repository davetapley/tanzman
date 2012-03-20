module Refinery
  module Courses
    module Admin
      class CoursesController < ::Refinery::AdminController

        crudify :'refinery/courses/course',
                :title_attribute => 'name', :xhr_paging => true

        def update
          @course = Refinery::Courses::Course.find_by_id( params[:id] )
          prerequisite = Refinery::Courses::Course.find_by_id( params[:course][:prerequisite] )
          if @course.update_attributes( params[:course].merge( prerequisite: prerequisite ) )
            render :edit
          else
            render :edit
          end

        end

      end
    end
  end
end

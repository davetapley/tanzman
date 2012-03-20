class AddCourseDependencyRelation < ActiveRecord::Migration
  def change
    add_column :refinery_courses, :prerequisite, :integer
  end
end


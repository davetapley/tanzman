module Refinery
  module Courses
    class Course < Refinery::Core::BaseModel

      belongs_to :prerequisite, class_name: 'Refinery::Courses::Course', :foreign_key => "prerequisite"

      self.table_name = 'refinery_courses'

      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true

      def valid_prerequisites
        return Refinery::Courses::Course.all.collect{|c| [c.name, c.id] if c != self}.compact
      end

    end
  end
end

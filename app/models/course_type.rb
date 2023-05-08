class CourseType < ApplicationRecord
  has_many :courses
  belongs_to :school
end

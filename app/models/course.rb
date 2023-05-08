class Course < ApplicationRecord
  belongs_to :edition
  belongs_to :course_type
end

class Task < ApplicationRecord
  belongs_to :robot, optional: true
end

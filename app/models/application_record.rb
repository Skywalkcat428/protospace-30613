class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  belongs_to :users
  belongs_to :prototypes
end

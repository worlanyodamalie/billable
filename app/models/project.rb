class Project < ActiveRecord::Base
  belongs_to :client
  has_many :worksessions, dependent: :destroy
end

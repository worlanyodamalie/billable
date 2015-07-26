class Client < ActiveRecord::Base
  belongs_to :user
  has_many :projects
  has_many :work_sessions, :through => :projects

  validates :name, :user, presence: true
end

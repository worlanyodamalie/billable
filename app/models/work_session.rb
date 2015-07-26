class WorkSession < ActiveRecord::Base
  belongs_to :project
  belongs_to :client
  belongs_to :user

  validates :project, presence: true
  validates :start, presence: true
  validates_datetime :start
  validates_datetime :end, :after => :start, :after_message => 'must be after start'

  def duration
  	return (self.end - self.start)
  end

end

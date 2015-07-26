class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :work_sessions, dependent: :destroy

  validates :name, :client, presence: true

  public

  	def spent_seconds
  		return self.work_sessions.map(&:duration).inject(:+).to_f
  	end

  	def spent_minutes
  		return (self.spent_seconds / 60.0).to_f
  	end

  	def spent_hours
  		return (self.spent_minutes / 60.0).to_f
  	end

  	def spent_time
  		t = Time.gm(2000,1,1) + self.spent_seconds
  		return t
  	end

end

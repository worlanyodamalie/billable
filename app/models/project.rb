class Project < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :work_sessions, dependent: :destroy

  validates :name, :client, presence: true

  public

  	def spent_seconds(filter=nil)
  		return self.work_sessions.where(filter).map(&:duration).inject(:+).to_f
  	end

  	def spent_minutes(filter=nil)
  		return (self.spent_seconds(filter) / 60.0).to_f
  	end

  	def spent_hours(filter=nil)
  		return (self.spent_minutes(filter) / 60.0).to_f
  	end

  	def spent_time(filter=nil)
  		t = Time.gm(2000,1,1) + self.spent_seconds(filter)
  		return t
  	end

end

class User < ActiveRecord::Base

	has_many :clients, dependent: :destroy
	belongs_to :user_level

	validates :username, :email, presence: true, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	has_secure_password

	after_destroy :ensure_an_user_remains

	private

		def ensure_an_user_remains
			if User.count.zero?
				raise "Can't delete last user"
			end
		end
end

class ApplicationController < ActionController::API
	def current_sms_key
		SmsKey.first
	end
end

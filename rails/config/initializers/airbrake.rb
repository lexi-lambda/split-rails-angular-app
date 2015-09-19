if ENVied.AIRBRAKE_API_KEY.present?
  Airbrake.configure do |config|
    config.api_key = ENVied.AIRBRAKE_API_KEY
  end
end

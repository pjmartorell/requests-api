Apipie.configure do |config|
  config.app_name                = "RequestsAPI"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  config.app_info								 = "Small restful API-only app using Rails 5"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'ml1PZQLuIWrDsDklAFhA', 'IfPlMYxe2yn6IjboCYZegaFXfN3uZg2IuY96LYuXDw'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '574502399273390', '38e59830b521c4fb4f93a8c546fca32f'
end
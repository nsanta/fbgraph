class FacebookGraphSettings < Settingslogic
  source "#{Rails.root}/config/settings/fbgraph_settings.yml"
  namespace Rails.env
end

# TODO:remove and add to documentation
# Place in /your_rails_app/config/settings/fbgraph_settings.yml
# defaults: &defaults
#   client_id: yourclientid
#   secret_id: yoursecretid
# development:
#   <<: *defaults
#
# test:
#   <<: *defaults
#
# production:
#   <<: *defaults

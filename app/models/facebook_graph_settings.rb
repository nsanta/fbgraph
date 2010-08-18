class FacebookGraphSettings < Settingslogic
<<<<<<< HEAD
    source "#{Rails.root}/config/fbgraph_settings.yml"
    namespace Rails.env
end
=======
    source "#{Rails.root}/config/settings/fbgraph_settings.yml"
    namespace Rails.env
end

# TODO:remove and add to documentation
# Place in /your_rails_app/config/fbgraph_settings.yml
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
>>>>>>> 94780e6dd7c0f90ef5081c9a8d60360560cb4c42

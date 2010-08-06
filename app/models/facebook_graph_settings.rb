class FacebookGraphSettings < Settingslogic
    source "#{Rails.root}/config/fbgraph_settings.yml"
    namespace Rails.env
end
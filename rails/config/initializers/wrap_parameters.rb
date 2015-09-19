# Disable parameter auto-wrapping magic.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: []
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#  self.include_root_in_json = true
# end

if defined?(JazzFingers)
  JazzFingers.configure do |config|
    config.color_prompt = true
    config.awesome_print = true
    config.coolline = false
    config.application_name = Rails5Sandbox
  end

  require 'jazz_fingers/setup'
end

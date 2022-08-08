module ExceptionHandler

  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, 400)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: "Invalid Credentials" }, 400)
    end
  end
end

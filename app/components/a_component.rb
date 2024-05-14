class AComponent < ViewComponent::Base
  attr_reader :response_type

  def initialize(response_type:)
    @response_type = response_type
  end
end

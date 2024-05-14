class HomeController < ApplicationController
  def index
    request.variant = :compact
    render AComponent.new(response_type: "synchronous")
  end

  def create
    request.variant = :compact

    response_type = params[:response_type]

    case response_type
    when "turbo_drive"
      render AComponent.new(response_type:)
    when "turbo_stream"
      render(
        turbo_stream: turbo_stream.replace(
          "a-component",
          AComponent.new(response_type:)
        )
      )
    else
      raise "Unknown response type: #{params[:response_type].inspect}"
    end
  end
end

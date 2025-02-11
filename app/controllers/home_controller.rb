class HomeController < ApplicationController
  def index
    request.variant = :compact
    render locals: { response_type: "synchronous" }
  end

  def create
    request.variant = :compact

    # Workaround: uncomment this line to update the lookup_context directly.
    # lookup_context.variants = :compact

    response_type = params[:response_type]

    case response_type
    when "turbo_drive"
      render :create, locals: { response_type: }
    when "turbo_stream"
      render(
        turbo_stream: turbo_stream.replace("a-component", partial: "home/frame", locals: { response_type: })
      )
    else
      raise "Unknown response type: #{params[:response_type].inspect}"
    end
  end
end

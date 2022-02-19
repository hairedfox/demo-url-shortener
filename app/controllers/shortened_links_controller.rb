class ShortenedLinksController < ApplicationController
  def show
    shortened_link = ShortenedLink.find(params[:uid])

    redirect_to shortened_link.url, allow_other_host: true
  end

  def create
    shortened_link = ShortenedLink.create!(
      url: params[:url]
    )

    json_response = ShortenedLinkSerializer.new(shortened_link).serializable_hash

    render json: json_response, status: :ok
  end
end

class LinksController < ApplicationController

  def create
    params.require(:url)
    link = Link.new(url: params[:url])
    if link.save!
      render json: link.short_url(request.base_url), status: 200
    else
      render json: { "message": "link cropping process failed"}, status: 500
    end
  end

  def show
    params.require(:code)

    redirect_to url, allow_other_host: true and return if url.present?

    render json: { "message": "Invalid link" }, status: 404
  end

  private

  def url
    @url ||= Link.find_by(code: params[:code]).try(:url)
  end
end

class LinksController < ApplicationController

  def create
    params.require(:url)
    create_link
    unless @link.errors.present?
      render json: @link.short_url(request.base_url), status: 200
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

  def create_link
    @link = Link.find_or_initialize_by(url: params[:url])
    @link.save unless @link.id
  end
end

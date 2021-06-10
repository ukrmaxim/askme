class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by!(name: params[:name])

    unless @hashtag.questions.present?
      render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
    end
  end
end

class SuccessController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :full]
  def index

  end

  def full

  end

end

class SuccessController < ApplicationController
  skip_before_action :authenticate_user!
  def index

  end

  def full

  end

  def ready

  end
end

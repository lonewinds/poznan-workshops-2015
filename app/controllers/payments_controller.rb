class PaymentsController < ApplicationController
  before_action :authenticate_user!

  expose(:students)

  def index
  end
end

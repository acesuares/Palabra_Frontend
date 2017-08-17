class ErrorController < ApplicationController
  def index
    render_404 "no route"
  end
end

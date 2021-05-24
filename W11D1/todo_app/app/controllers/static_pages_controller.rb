class StaticPagesController < ApplicationController
  def root
    render html: root
  end
end

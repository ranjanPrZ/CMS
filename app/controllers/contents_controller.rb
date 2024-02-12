class ContentsController < ApplicationController

  include SubjectTypeConstant
  def index
    @urls = SUB_TYPE
  end

  # def redirect
  #   redirect_to params['url'].split('3000').last
  # end
end

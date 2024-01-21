class ContentsController < ApplicationController
  def index
    @urls = [
      { name: 'Select contents type', url: ''},
      { name: 'Maths', url: quants_url },
      { name: 'Reasoning', url: reasonings_url },
      { name: 'General Science', url: general_sciences_url },
    ]
  end

  # def redirect
  #   redirect_to params['url'].split('3000').last
  # end
end

class ContentsController < ApplicationController
  def index
    @urls = [
      { name: 'Maths', url: new_quant_url },
      { name: 'Reasoning', url: new_reasoning_url },
      { name: 'General Science', url: new_general_science_url },
      # Add more URLs as needed
    ]
  end

  # def redirect
  #   redirect_to params['url'].split('3000').last
  # end
end

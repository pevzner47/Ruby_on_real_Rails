module SessionsHelper
  def logget_out?
    if flash[:alert]
      render 'check_your_details_message'
    end
  end

end

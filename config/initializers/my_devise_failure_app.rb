class MyDeviseFailureApp < Devise::FailureApp
  def respond
    params[:failure_reason] = warden_message
    if http_auth?
      http_auth
    elsif warden_options[:recall]
      recall
    else
      redirect
    end
  end
end

class PhoneVerificationsController < ApplicationController
  def new
  end

  def create
    #for production
    #verification_code = CodeGenerator.generate
    verification_code = 123
    #MessageSender.send_code(params[:phone_number], verification code)
    # byebug if params[:verification_code]
    if params[:verification_code] == verification_code.to_s
      redirect_to home_index_path
    end
  end
end
class PaymentsController < ApplicationController
  def create
    Payment.create(payment_params)
    redirect_to schedule_url
  end

  def payment_params
    params.require(:payment).permit(:pay_date, :expense_id)
  end
end

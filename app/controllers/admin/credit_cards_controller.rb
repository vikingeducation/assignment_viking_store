class Admin::CreditCardsController < AdminController

  def destroy
    @user = User.find(params[:user_id])
    @card = CreditCard.find(params[:id])

    if @user.credit_cards.destroy(@card)
      redirect_to admin_user_url(@user), notice: "Card successfully destroyed."
    else
      redirect_to admin_user_url(@user), alert: "Card could not be destroyed."
    end
  end
end
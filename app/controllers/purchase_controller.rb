class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @product = Product.find(params[:id])
    @product.buyer_id = current_user.id
    @product.save
    
    
    
    # = Product.create(buyer_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
    # テーブルからpayjpの顧客IDを検索
    binding.pry

    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_10114eafe2605308cd83bd02"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      # binding.pry
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_10114eafe2605308cd83bd02"
    charge = Payjp::Charge.create(
      :amount => 10000,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    redirect_to action: 'done' #完了画面に移動
  end

  def done
  end


  private

  def products_params
    params.require(:product).permit(:name).merge(buyer_id: current_user.id)
    binding.pry
  end

  # binding.pry
end

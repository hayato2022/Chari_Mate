class Calory < ApplicationRecord

  belongs_to :user

  # 消費カロリーを求めるメソッド
  def calorie_consumption
    (mets * weight * (minute * 0.0166667) * 1.05).round
  end
end

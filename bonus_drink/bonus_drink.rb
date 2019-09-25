class BonusDrink
    BONUS_ONE_PER_DRINK = 3
  
    class << self
      def buy_drink_with_bonus(number)
        return number if number < BONUS_ONE_PER_DRINK
        div = number.div(BONUS_ONE_PER_DRINK)
        modulo = number.modulo(BONUS_ONE_PER_DRINK)
        div * BONUS_ONE_PER_DRINK + buy_drink_with_bonus(div + modulo)
      end
    end
  end
  
  p BonusDrink.buy_drink_with_bonus(0)
  p BonusDrink.buy_drink_with_bonus(1)
  p BonusDrink.buy_drink_with_bonus(3)
  p BonusDrink.buy_drink_with_bonus(11)
  p BonusDrink.buy_drink_with_bonus(100)
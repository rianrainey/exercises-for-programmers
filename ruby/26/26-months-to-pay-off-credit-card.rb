#!/usr/bin/ruby

class PayOffCreditCard
    def initialize(options={})
        @balance = options[:balance]
        @apr     = options[:apr]
        @payment = options[:payment]
    end

    def calculateMonthsUntilPaidOff
        months = -(1.to_f/30)*(numerator.to_f/denominator)
        print "It will take you #{months} months"
    end

    private
        def numerator
            Math.log(1+(@balance.to_f/@payment)*(1-(1+daily_rate)**-30))
        end

        def denominator
            Math.log(1+daily_rate)
        end

        def daily_rate
            @apr.to_f/365
        end
end

print 'What is your credit card balance? '
balance = gets.to_i

print 'What is the APR on the card (as a percent)? '
apr = gets.to_i

print 'What is the monthly payment you will make? '
payment = gets.to_i

card = PayOffCreditCard.new(balance: balance, apr: apr, payment: payment)
card.calculateMonthsUntilPaidOff

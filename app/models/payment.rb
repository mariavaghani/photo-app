class Payment < ApplicationRecord
    attr_accessor :card_number, :card_cvc, :card_expires_month, :card_expires_year
    belongs_to :user

    def self.month_options
        Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1 ] }
    end

    def self.year_options
        (Date.today.year..(Date.today.year+10)).to_a
    end

    def process_payment
        

        customer = Stripe::Customer.create email: email, source: token
            
        # `source` is obtained with Stripe.js; see https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token
        Stripe::Charge.create({
                                amount: 1000,
                                currency: 'usd',
                                source: self.token,
                                description: 'Premium',
                                customer: customer.id
        })

    end
end

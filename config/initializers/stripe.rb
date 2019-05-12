Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.send(Rails.env)[:stripe_publishable_key],
  :secret_key      => Rails.application.credentials.send(Rails.env)[:stripe_secret_key]
}

#Stripe.api_key = Rails.configuration.stripe[:secret_key]
Stripe.api_key = Rails.application.credentials.send(Rails.env)[:stripe_secret_key]
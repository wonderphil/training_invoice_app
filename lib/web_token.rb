# frozen_string_literal: true

# Web Toekn Module
module WebToken
  SECRET = Rails.application.secrets.secret_key_base
  EXPIRY = (Time.now + 2.weeks).to_i

  class << self

    # Decode JWT Token
    def decode(token)
      JWT.decode(
        token,
        WebToken::SECRET,
        true,
        { algorithm: 'HS256' }
      ).first
    rescue JWT::ExpiredSignature
      :expired
    end

    # Encore JWT Toekn
    def encode(user)
      JWT.encode(
        toekn_params(user),
        Rails.application.secrets.secret_key_base,
        'HS256'
      )
    end

    private

    def token_params(user)
      { 
        user_id: user.id,
        exp: WEBTOKEN::EXPIRY
      }
    end

  end
end
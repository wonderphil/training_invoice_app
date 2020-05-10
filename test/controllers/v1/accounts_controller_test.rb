# frozen_string_literal: true

require 'test_helper'

module V1
  class AccountsControllerTest < ActionDispatch::IntegrationTest
    setup do
      user = users(:one)

      @header = {
        'X-User-Email': user.email,
        'X-User-Token': user.authentication_token
      }
    end

    test 'Creates Account for user' do 
      account_params = {
        name: Faker::Company.name,
        tax_payer_id: Faker::Company.ein,
        vat_rate: 7.8,
        address: Faker::Address.street_name,
        default_currency: 'USD'
      }

      post(
        v1_accounts_path, 
        headers: @header, 
        params: { account: account_params }
      )

      account = JSON.parse(@response.body)['data']['account']

      assert_response :success

      assert account['name'] == account_params[:name]
    end

  end
end

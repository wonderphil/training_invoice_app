# frozen_string_literal: true

require 'test_helper'

module V1
  class ContactsControllerTest < ActionDispatch::IntegrationTest
    test 'should only get contacts for company one' do
      account = accounts(:account_one)

      not_company_one_contacts = contacts(:contact_two)

      get v1_contacts_path(account_id: account.id)

      contacts = JSON.parse(@response.body)['data']
      contact_ids = contacts.map { |contact| contact['id'] }

      assert_response :success
      assert_not_includes contact_ids, not_company_one_contacts.id
    end

    test 'Creates contact under correct org' do
      account = accounts(:account_one)
      org     = account.organizations.first

      first_name = Faker::Name.name
      last_name  = Faker::Name.name

      post(
        v1_organization_contacts_path(
          account_id: account.id,
          organization_id: org.id
        ),
        params: {
          contact: { first_name: first_name, last_name: last_name }
        }
      )

      contact = JSON.parse(@response.body)['data']['contact']

      assert_response :created
      assert_equal first_name, contact['first_name']
      assert_equal last_name, contact['last_name']
    end
  end
end

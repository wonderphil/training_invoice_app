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

  end
end

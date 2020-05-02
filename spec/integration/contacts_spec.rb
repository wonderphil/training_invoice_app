require 'swagger_helper'

describe 'Contacts API' do

  path '/v1/contacts' do

    post 'Creates a contact' do
      tags 'Contacts'
      consumes 'application/json'
      parameter name: :contact, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string }
        },
        required: [ 'first_name', 'last_name', 'email' ]
      }

      response '201', 'contact created' do
        let(:contact) { { first_name: 'black', last_name: 'betty', email: 'bb@somewhere.io' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:contact) { { first_name: 'black' } }
        run_test!
      end
    end
  end

  path '/v1/contacts' do

    get 'Retrieves all contacts' do
      tags 'Contacts'
      produces 'application/json'

      response '200', 'found Contacts' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            first_name: { type: :string },
            last_name: { type: :string },
            email: { type: :string }
          },
          required: [ 'id', 'first_name', 'last_name', 'email' ]

        let(:id) { Contact.create(first_name: 'foo', last_name: 'bar', email: 'foobar@somewhere.io').id }
        run_test!
      end

      response '404', 'No contacts not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
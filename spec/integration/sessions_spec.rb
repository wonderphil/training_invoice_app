require 'swagger_helper'

describe 'Sessions API' do

  path '/v1/sessions' do

    post 'Creates a session' do
      tags 'Sessions'
      consumes 'application/json'
      parameter name: :session, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: {type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '201', 'Session created' do
        let(:session) { { email: 'bb@somewhere.io', password: 'pass1234' } }
        run_test!
      end

      response '401', 'unauthorized request' do
        let(:session) { { email: 'bb@somewhere.io', password: 'p' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:session) { { first_name: 'black' } }
        run_test!
      end
    end
  end

end
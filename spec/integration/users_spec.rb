require 'swagger_helper'

describe 'Users API' do

  path '/v1/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: {type: :string },
          password_comfirmation: {type: :string }
        },
        required: [ 'email', 'password', 'password_comfirmation' ]
      }

      response '201', 'User created' do
        let(:session) { { email: 'bb@somewhere.io', password: 'pass1234', password_comfirmation: 'pass1234' } }
        run_test!
      end


      response '422', 'invalid request' do
        let(:session) { { email: 'black' } }
        run_test!
      end
    end
  end

end
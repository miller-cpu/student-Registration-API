require 'swagger_helper'

RSpec.describe 'api/v1/address_province_lists', type: :request do

  path '/api/v1/address_province_lists' do

    post('create address_province_list') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :address_province_list, in: :body, schema: {
          type: :object,
          properties: {
            provinsi: {type: :string, minLength: 3, maxLength: 35},
          },
          required: %w[provinsi]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/address_province_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show address_province_list') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update address_province_list') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update address_province_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address_province_list, in: :body, schema: {
          type: :object,
          properties: {
            provinsi: {type: :string, minLength: 3, maxLength: 35},
          },
          # required: %w[provinsi]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete address_province_list') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :address_province_list, in: :body, schema: {
          type: :object,
          properties: {
            provinsi: {type: :string, minLength: 3, maxLength: 35},
          },
          # required: %w[provinsi]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end

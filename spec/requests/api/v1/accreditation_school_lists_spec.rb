require 'swagger_helper'

RSpec.describe 'api/v1/accreditation_school_lists', type: :request do

  path '/api/v1/accreditation_school_lists' do
    get('accreditation school lists') do
      tags 'Accreditation school list endpoint'
      response(200, 'successful') do

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

    post('create accreditation_school_list') do
      tags 'Accreditation school list endpoint'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :accreditation_school_list, in: :body, schema: {
          type: :object,
          properties: {
            accreditation_school_list: {
              type: :object,
              properties: {
                akreditasi: { type: :string, minLength: 1, maxLength: 15 },
              },
              required: %w[akreditasi]
            }
          }
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

  path '/api/v1/accreditation_school_lists/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show accreditation_school_list') do
      tags 'Accreditation school list endpoint'
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

    patch('update accreditation_school_list') do
      tags 'Accreditation school list endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :accreditation_school_list, in: :body, schema: {
          type: :object,
          properties: {
            accreditation_school_list: {
              type: :object,
              properties: {
                akreditasi: { type: :string, minLength: 1, maxLength: 15 },
              },
              # required: %w[akreditasi]
            }
          }
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

    put('update accreditation_school_list') do
      tags 'Accreditation school list endpoint'
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :accreditation_school_list, in: :body, schema: {
          type: :object,
          properties: {
            accreditation_school_list: {
              type: :object,
              properties: {
                akreditasi: { type: :string, minLength: 1, maxLength: 15 },
              },
              # required: %w[akreditasi]
            }
          }
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

    delete('delete accreditation_school_list') do
      tags 'Accreditation school list endpoint'
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
  end
end

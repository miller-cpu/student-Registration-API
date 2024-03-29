require "test_helper"

class AddressKabupatenListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    post api_v1_auth_login_url, params: {
      email: users(:admin_michael).email,
      password: 'password'
    }, as: :json
    body = JSON.parse(response.body)
    @token = body['token']
  end

  test 'should show all kabupaten list' do
    get api_v1_address_kabupaten_lists_url, as: :json
    assert_response :success
  end

  test 'should create kabupaten list' do
    assert_difference('AddressKabupatenList.count') do
      post api_v1_address_kabupaten_lists_url,
           params: { address_kabupaten_list:
                       { kabupaten: 'luake',
                         address_province_list_id: address_province_lists(:aceh).id
                       } }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
    assert_response :success
  end

  test 'should update kabupaten' do
    patch api_v1_address_kabupaten_list_url(address_kabupaten_lists(:acehtengah)),
          params: {address_kabupaten_list: {
            kabupaten: 'aceh gayo selatan' }
          }, headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
    address_kabupaten_lists(:acehtengah).reload
    assert_equal 'aceh gayo selatan', address_kabupaten_lists(:acehtengah).kabupaten
  end

  test 'should show kabupaten list' do
    get api_v1_address_kabupaten_list_url(address_kabupaten_lists(:acehtengah)),
        headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    assert_response :success
  end

  test 'should destroy address kabupaten' do
    assert_difference 'AddressKabupatenList.count', -1 do
      delete api_v1_address_kabupaten_list_url(address_kabupaten_lists(:acehtengah)),
          headers: {'Authorization'=>"Bearer #{@token}"}, as: :json
    end
  end
end

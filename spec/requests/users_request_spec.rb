require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'renders users new' do
    get '/users/new'
    expect(response).to render_template(:new)
  end

  scenario 'trying to get to show redirects you to login' do
    get '/users/1'
    expect(response).to redirect_to('/login')
    get '/users/new'
    post '/users', params: { user: { name: 'foo', username: 'foobar' } }
    expect(response).to redirect_to(assigns(:user))
    follow_redirect!
    expect(response).to render_template(:show)
  end
end

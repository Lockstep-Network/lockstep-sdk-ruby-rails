RSpec.shared_context 'auth/bearer_token' do
  before do
    Lockstep::Client.set_api_key(ENV['PLATFORM_API_KEY'] ||= "PLATFORM_API_KEY")
  end
end

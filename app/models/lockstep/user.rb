class Lockstep::User < Lockstep::ApiRecord
  self.model_name_uri = "v1/UserAccounts"
  self.id_ref = "user_id"
  load_schema(Schema::UserAccount)

  # # Load the first account
  belongs_to :account, class_name: "Lockstep::Account", loader: ->(user) { Lockstep::Account.first }

  alias_attribute :last_logged_in, :b2_c_last_logged_in

  def self.invite(email_addresses)
    emails = email_addresses.map { |email| { email: email } }
    resp = resource.post('/invite', body: emails, params: {})
    parsed_response = JSON.parse(resp.body)
    case resp.code.to_s
    when '401'
      raise Lockstep::Exceptions::UnauthorizedError, parsed_response['title']
    when '400'
      raise Lockstep::Exceptions::BadRequestError, parsed_response['title']
    when '404'
      raise Lockstep::Exceptions::RecordNotFound, parsed_response['title']
    when '200'
      snake_case_parsed_response = parsed_response.map { |response| response.transform_keys { |key| key.underscore } }
      result = snake_case_parsed_response&.map do |user|
        if user['success']
          invited_user_in_snake_case = user['invited_user'].transform_keys { |key| key.underscore }
          user['invited_user'] = Lockstep::User.new(invited_user_in_snake_case)
        else
          invited_user = Lockstep::User.new(email: user['email'])
          invited_user.errors.add "email", "#{user['error_message']}"
          user['invited_user'] = invited_user
        end
      end
    else
      raise Lockstep::Exceptions::BadRequestError, parsed_response
    end
  end
end

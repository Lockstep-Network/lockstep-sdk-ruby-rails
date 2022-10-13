class Schema::MagicLink < Lockstep::ApiRecord

  # ApiRecord will crash unless `id_ref` is defined
  def self.id_ref
    nil
  end

  field :group_key
  field :user_id
  field :user_role
  field :application_id
  field :expires
  field :created
  field :create_user_id
  field :modified
  field :modified_user_id
  field :magic_link_url

end
class Lockstep::UserRole < Lockstep::ApiRecord
  self.model_name_uri = "v1/UserRoles"
  self.id_ref = "user_role_id"
  load_schema(Schema::UserRole)
end
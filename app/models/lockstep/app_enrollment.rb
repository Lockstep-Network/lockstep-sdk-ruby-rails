class Lockstep::AppEnrollment < Lockstep::ApiRecord
  self.model_name_uri = "v1/AppEnrollments"
  self.id_ref = "appEnrollmentId"
  load_schema(Schema::AppEnrollment)
end
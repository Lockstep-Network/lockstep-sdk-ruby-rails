class Schema::SfServicersAuthRequest < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # The unique identifier of the servicer to integrate with.
  # @type: string
  field :servicer_id

  # Enum: "signup" "login"
  # The initial integration page to display. This may be ignored, depending on the integration.
  # @type: string
  field :landing_page_type

  # An optional field specifing the URI that the browser will be redirected to at the end of the OAuth flow.
  # If not specified, the browser will be redirected to the Payments Acceptance Service marketplace UI.
  # @type: string
  field :success_redirect_uri

  # An optional field that the browser will be redirect to at the end of the OAuth flow.
  # If a success redirect URI is included but no failure URI, the browser will be redirected
  # to the success URI in case of errors. A failureReason query parameters will be included
  # in case of errors; see above for possible values. Including a failure URI but no
  # success URI will generate a 400 error.
  # @type: string
  field :failure_redirect_uri



end
class Schema::ViewBoxSettings < Lockstep::ApiRecord

# ApiRecord will crash unless `id_ref` is defined
def self.id_ref
  nil
end

  # ViewBox minX setting for this Company's logo.
  # @type: number
  # @format: double
  field :logo_view_box_min_x

  # ViewBox minY setting for this Company's logo.
  # @type: number
  # @format: double
  field :logo_view_box_min_y

  # ViewBox width setting for this Company's logo.
  # @type: number
  # @format: double
  field :logo_view_box_width

  # ViewBox height setting for this Company's logo.
  # @type: number
  # @format: double
  field :logo_view_box_height



end
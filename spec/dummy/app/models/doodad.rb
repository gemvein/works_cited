# frozen_string_literal: true

class Doodad < ApplicationRecord
  include WorksCited::Concerns::Models::HasWorksCited
end

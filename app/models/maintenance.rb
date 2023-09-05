class Maintenance < ApplicationRecord
  belongs_to :engine
  self.inheritance_column = :maintenance_type # Change the column name for STI
end

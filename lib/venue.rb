class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    self.name.capitalize!()
  end

end

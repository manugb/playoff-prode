require 'active_support/concern'

module Current
  extend ActiveSupport::Concern

  included do
    default_scope { where("created_at > ?", Date.new(Date.today.year)) }
  end
end

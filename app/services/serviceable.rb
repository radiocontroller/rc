module Serviceable
  extend ActiveSupport::Concern

  included do
    def self.call(*args)
      new(*args).call
    end
  end

  def call
    raise "call method must be implemented"
  end
end

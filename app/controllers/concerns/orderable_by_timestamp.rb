module OrderableByTimestamp
  extend ActiveSupport::Concern

  included do
    scope :by_recently_created, -> { order(created_at: :desc) }
  end
end

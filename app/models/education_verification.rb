class EducationVerification < ActiveRecord::Base
	belongs_to :customer
  validates_presence_of :stream, :month, :year
  validates :year, numericality: { only_integer: true }
  validates :month, numericality: { only_integer: true }
  validates_inclusion_of :month, :in => 1..12
  include Workflow
  workflow_column :status

  workflow do
    state :pending do
      event :submit, :transitions_to => :in_progress
    end
    state :in_progress do
      event :review, :transitions_to => :completed
    end
    state :completed
  end

end

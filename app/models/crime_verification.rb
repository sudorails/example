class CrimeVerification < ActiveRecord::Base
 belongs_to :customer

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

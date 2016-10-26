require 'rails_helper'

describe Match, type: :model do
  it { should validate_presence_of(:competitor1) }
  it { should validate_presence_of(:competitor2) }
end

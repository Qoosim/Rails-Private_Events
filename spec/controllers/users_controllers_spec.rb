# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it { should route(:get, 'signup').to(action: :new) }

  it { should route(:post, 'signup').to(action: :create) }

  it { should route(:get, 'profile').to(action: :show) }
end

require 'rails_helper'

RSpec.describe Payment do
  describe 'database columns' do
    it { should have_db_column :january }
    it { should have_db_column :february }
    it { should have_db_column :march }
    it { should have_db_column :april }
    it { should have_db_column :may }
    it { should have_db_column :june }
    it { should have_db_column :july }
    it { should have_db_column :august }
    it { should have_db_column :september }
    it { should have_db_column :october }
    it { should have_db_column :november }
    it { should have_db_column :december }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end

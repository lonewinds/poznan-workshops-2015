require 'spec_helper'

feature 'User visits payments page' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:payment) { create :payment, january: Date.new(2015, 01, 05), student: student }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
  end

  scenario 'should see student(s) full name' do
    expect(page).to have_content 'Jan Nowak'
  end

  scenario 'should see january tuition date' do
    expect(page).to have_content '2015-01-05'
  end

  scenario 'only when sign in' do
    logout
    visit payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
require "application_system_test_case"

class TestGeneralsTest < ApplicationSystemTestCase
  test 'Invalid query should return error' do
    visit root_path
    fill_in 'title', with: 'nothingwillmatchthat'
    find('input[type="submit"]').click
    assert_selector('body > div > p', text: 'Pas de film trouvé')
  end
  
  test 'Valid query should return movies' do
    visit root_path
    fill_in 'title', with: 'Godzilla'
    find('input[type="submit"]').click
    assert_selector('body > div > div > div:nth-child(1) > div')
  end
  
  test 'Valid query should return poster' do
    visit root_path
    fill_in 'title', with: 'Godzilla'
    find('input[type="submit"]').click
    assert_selector('body > div > div > div:nth-child(1) > div > img')
  end
  
  test 'Valid query should return director' do
    visit root_path
    fill_in 'title', with: 'Tintin'
    find('input[type="submit"]').click
    assert_selector('body > div > div > div:nth-child(1) > div > div > p:nth-child(2)')
  end
end


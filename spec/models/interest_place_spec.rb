require 'rails_helper'

RSpec.describe InterestPlace, type: :model do
  fixtures :postals
  fixtures :settlements
  fixtures :users

  context 'validations' do

   let(:interest_place) { InterestPlace.new }
   it 'does not save an iterest place when it is empty' do
     result = interest_place.save
     expect(result).to eq false
   end

   it 'does not save an iterest place when settlement is empty' do
   	 interest_place.postal = postals(:one)
     result = interest_place.save
     expect(result).to eq false
   end

   it 'does not save an iterest place when postal is empty' do
   	 interest_place.settlement = settlements(:one)
     result = interest_place.save
     expect(result).to eq false
   end

   it 'does not save an iterest place when user is empty' do
   	 interest_place.settlement = settlements(:one)
   	 interest_place.postal = postals(:one)
     result = interest_place.save
     expect(result).to eq false
   end

   it 'does save an iterest place when postal and settlement is given' do
   	 interest_place.settlement = settlements(:four)
   	 interest_place.postal = postals(:one)
   	 interest_place.user = users(:one)
     result = interest_place.save!
     expect(result).to eq true
   end
  end
end

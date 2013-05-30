require 'spec_helper'

describe 'A status request with a LoadCheck' do
  before do
    Rapporteur::Checker.add_check(Rapporteur::Checks::LoadCheck)
    Rapporteur::Checks::LoadCheck.stub(:current_load).and_return(current_load)
  end

  subject { get(status_path) ; response }

  context 'with a load below the threshold' do
    let(:current_load) { 1.0 }

    it_behaves_like 'a successful status response'

    it 'contains the load value in the messages' do
      json = JSON.parse(subject.body)
      expect(json["messages"]["load"]).to eq(1.0)
    end
  end

  context 'with a load above the threshold' do
    let(:current_load) { 9.0 }

    it_behaves_like 'an erred status response'

    it 'contains a message regarding the excess load' do
      expect(subject).to include_status_error_message(I18n.t('activemodel.errors.models.rapporteur/checker.attributes.base.excess_load'))
    end
  end
end

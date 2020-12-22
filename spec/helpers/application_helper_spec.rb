RSpec.describe ApplicationHelper, type: :helper do
  describe 'correct title name' do
    context '引数に何も渡さない or nilを渡した場合' do
      it { expect(full_title(' ')).to eq 'Crayfisher' }
      it { expect(full_title(nil)).to eq 'Crayfisher' }
      it { expect(full_title).to eq 'Crayfisher' }
    end

    context '引数を渡す場合' do
      it { expect(full_title('test')).to eq 'test | Crayfisher' }
    end
  end
end

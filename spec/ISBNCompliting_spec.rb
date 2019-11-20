# frozen_string_literal: true

require 'spec_helper'
require_relative '../ISBNCompliting'

RSpec.describe ISBNCompliting do
  subject(:isbn_Compliting) { ISBNCompliting.new('978014300724') }

  context "check the attribute accessors" do
    it { expect(isbn_Compliting.isbn).to eq('978014300724') }
    it "should have write isbn" do
      subject.isbn = '978014300723'
      expect(subject.isbn).to eq('978014300723')
      expect(subject.isbn.size).to eq(12)
    end
  end

  context "#initialize" do
    it { is_expected.to have_attributes(isbn: '978014300724') }
  end

  context "#to_array" do
    let(:sub_array) {subject.to_array}
    it "should return array" do
      expect(sub_array).to eq([9, 7, 8, 0, 1, 4, 3, 0, 0, 7, 2, 4])
      expect(sub_array.size).to eq(12)
      expect(sub_array).to be_a_kind_of(Array)
    end
  end

  context "#mod10sum" do
    let(:sub_mod) {subject.mod10sum}
    it "should return single number" do
      expect(sub_mod).to eq(9)
      expect(sub_mod).to be_a_kind_of(Integer)
    end
  end

  context "#complete" do
    let(:sub_comp) {subject.complete}
    it "should return integer" do
      expect(sub_comp).to eq(9780143007241)
      expect(sub_comp).to be_a_kind_of(Integer)
    end
  end
end
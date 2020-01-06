# frozen_string_literal: true

RSpec.describe Dry::Inflector do
  describe '#classify' do
    it 'classifies data_mapper as DataMapper' do
      expect(subject.classify(i('data_mapper'))).to eq('DataMapper')
    end

    it 'classifies data.mapper as Mapper' do
      expect(subject.classify(i('data.mapper'))).to eq('Mapper')
    end

    it 'classifies enlarged_testes as EnlargedTestis' do
      expect(subject.classify(i('enlarged_testes'))).to eq('EnlargedTestis')
    end

    it 'singularizes string first: classifies data_mappers as egg_and_hams as EggAndHam' do
      expect(subject.classify(i('egg_and_hams'))).to eq('EggAndHam')
    end

    it 'accepts symbols' do
      expect(subject.classify(:data_mapper)).to eq('DataMapper')
    end
  end
end

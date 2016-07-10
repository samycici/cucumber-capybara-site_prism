require 'rspec'
require_relative '../calculadora'

describe Calculadora do
  subject(:calculadora) { Calculadora.new }

  describe ".somar" do
    context "dado '4' e '2'" do
      it "retornar 6" do
        expect(calculadora.somar(4, 2)).to eql(6)
      end
    end
  end

  describe ".subtrair" do
    context "dado '4' e '2'" do
      it "retornar 2" do
        expect(calculadora.subtrair(4, 2)).to eql(2)
      end
    end
  end

  describe ".dividir" do
    context "dado '4' e '2'" do
      it "retornar 2" do
        expect(calculadora.dividir(4, 2)).to eql(2)
      end
    end
  end

  describe ".multiplicar" do
    context "dado '4' e '2'" do
      it "retornar 8" do
        expect(calculadora.multiplicar(4, 2)).to eql(8)
      end
    end
  end
end

#test/main.rb
require_relative "../main"

describe "Main" do
    it do
        expect(palindrome?('eye').class).to eql(TrueClass || FalseClass)
        expect(palindrome?('eye')).to be_truthy
        expect(palindrome?("_eye")).to be_truthy
        expect(palindrome?("race car")).to be_truthy
        expect(palindrome?("not a palindrome")).to be_falsey
        expect(palindrome?("A man, a plan, a canal. Panama")).to be_truthy
        expect(palindrome?("never odd or even")).to be_truthy
        expect(palindrome?("nope")).to be_falsey
        expect(palindrome?("almostomla")).to be_falsey
        expect(palindrome?("My age is 0, 0 si ega ym.")).to be_truthy
        expect(palindrome?("1 eye for of 1 eye.")).to be_falsey
        expect(palindrome?("0_0 (: /-\ :) 0-0")).to be_truthy
        expect(palindrome?("five|\_/|four")).to be_falsey
    end
end
  
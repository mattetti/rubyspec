require File.dirname(__FILE__) + '/../../../spec_helper'
require File.dirname(__FILE__) + '/shared/sinh'

ruby_version_is ""..."1.9" do
  describe "Math#sinh" do
    it_behaves_like :complex_math_sinh, :_, IncludesMath.new

    it "should be private" do
      IncludesMath.should have_private_instance_method(:sinh)
    end
  end

  describe "Math#sinh!" do
    it_behaves_like :complex_math_sinh_bang, :_, IncludesMath.new

    it "should be private" do
      IncludesMath.should have_private_instance_method(:sinh!)
    end
  end

  describe "Math.sinh" do
    it_behaves_like :complex_math_sinh, :_, Math
  end

  describe "Math.sinh!" do
    it_behaves_like :complex_math_sinh_bang, :_, Math
  end
end

require File.dirname(__FILE__) + '/../../../spec_helper'
require File.dirname(__FILE__) + '/shared/arg'

ruby_version_is ""..."1.9" do

  require 'complex'

  describe "Numeric#angle" do
    it_behaves_like :numeric_arg, :angle
  end
end

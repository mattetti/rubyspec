require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/common'

describe "Dir.foreach" do
  it "yields all names in an existing directory to the provided block" do
    a, b = [], []

    Dir.foreach(DirSpecs.mock_dir) {|f| a << f}
    Dir.foreach("#{DirSpecs.mock_dir}/deeply/nested") {|f| b << f}

    a.sort.should == DirSpecs.expected_paths
    b.sort.should == %w|. .. .dotfile.ext directory|
  end

  it "returns nil when successful" do
    Dir.foreach(DirSpecs.mock_dir) {|f| f}.should == nil
  end

  it "raises a SystemCallError if passed a nonexistent directory" do
    lambda { Dir.foreach(DirSpecs.nonexistent) {} }.should raise_error(SystemCallError)
  end
  
  ruby_version_is '' ... '1.8.7' do
    it 'raises a LocalJumpError if no block given' do
      lambda{ Dir.foreach(DirSpecs.mock_dir) }.should raise_error(LocalJumpError)
    end
  end

  ruby_version_is '1.8.7' do
    it 'returns an Enumerator if no block given' do
      Dir.foreach(DirSpecs.mock_dir).should be_kind_of(enumerator_class)
      Dir.foreach(DirSpecs.mock_dir).to_a.sort.should == DirSpecs.expected_paths
    end
  end

end

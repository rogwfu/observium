require File.expand_path('../support/helpers', __FILE__)

describe 'observium::default' do

  include Helpers::Observium

  # Check creation of directories
  it "creates observium directory" do
    directory(node["observium"]["install_dir"]).must_exist
  end

  # Check installation of dependent packages
  %w{snmp graphviz subversion rrdtool fping imagemagick whois mtr-tiny nmap ipmitool}.each do |pkg|
    it "installed #{pkg}" do 
      package("#{pkg}").must_be_installed()
    end
  end

  # Ensure the source code is checked out 
  it "checks out the Observium source code" do
    directory("#{node["observium"]["install_dir"]}/observium").must_exist
  end
end

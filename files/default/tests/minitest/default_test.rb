require File.expand_path('../support/helpers', __FILE__)

describe 'observium::default' do

  include Helpers::Observium

  # Check creation of directories
  it "creates observium directory" do
    directory(node["observium"]["log_dir"]).must_exist
  end

  # Check installation of dependent packages
  %w{snmp graphviz subversion rrdtool fping imagemagick whois mtr-tiny nmap ipmitool}.each do |pkg|
    it "installed #{pkg}" do 
      package("#{pkg}").must_be_installed()
    end
  end
end

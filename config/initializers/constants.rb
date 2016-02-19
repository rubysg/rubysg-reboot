module RubysgReboot

  File.open(File.join(File.dirname(__FILE__), "companies.yml")) do |file|
    COMPANIES = YAML.load(file).to_ary
  end
end

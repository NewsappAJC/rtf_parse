require "rtf_filter/version"
require "open4"

module RtfParse
  attr_accessor(:text)
  def self._parse(rtf, command)
    Open4::popen4(command) do |pid, stdin, stdout, stderr|
      stdin.puts rtf
      stdin.close
      @text = stdout.read.strip
    end
    return @text
  end

  def self.to_text(source)
    config_path = File.expand_path(File.dirname(__FILE__) + '/../config')
    command = "unrtf -P #{config_path} -t text"
    rtf =  source =~ /^{\\rtf/ ?
      source :
      File.open(source, 'r').read

    return _parse(rtf, command)
  end

  def self.to_html(source)
    config_path = File.expand_path(File.dirname(__FILE__) + '/../config')
    command = "unrtf -P #{config_path} -t html"
    rtf =  source =~ /^{\\rtf/ ?
      source :
      File.open(source, 'r').read

    return _parse(rtf, command)
  end

  def self.custom_parse(source, options = {})
    p options
    config_path = options[:config_path] || File.expand_path(File.dirname(__FILE__) + '/../config')
    tags_file = options[:tags_file] || 'text'
    command = "unrtf -P #{config_path} -t #{tags_file}"
    rtf =  source =~ /^{\\rtf/ ?
      source :
      File.open(source, 'r').read

    return _parse(rtf, command)
  end

  class << self
    private :_parse
  end
end

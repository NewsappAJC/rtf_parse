require "rtf_parse/version"
require "open4"

module RtfParse
  attr_accessor(:text, :err)

  def self.to_text(source)
    config_path = File.expand_path(File.dirname(__FILE__) + '/../config')
    command = "unrtf -P #{config_path} -t text --nopict --quiet"
    rtf = _get_source_content(source)

    text = _parse(rtf, command)
    return _clean_header(text)
  end

  def self.to_html(source)
    config_path = File.expand_path(File.dirname(__FILE__) + '/../config')
    command = "unrtf -P #{config_path} -t html --nopict --quiet"
    rtf = _get_source_content(source)

    return _parse(rtf, command)
  end

  def self.custom_parse(source, options = {})
    config_path = options[:config_path] || File.expand_path(File.dirname(__FILE__) + '/../config')
    tags_file = options[:tags_file] || 'text'
    command = "unrtf -P #{config_path} -t #{tags_file} --nopict --quiet"
    rtf = _get_source_content(source)

    return _parse(rtf, command)
  end

  def self._parse(rtf, command)
    Open4::popen4(command) do |pid, stdin, stdout, stderr|
      stdin.puts rtf
      stdin.close
      @text = stdout.read.strip
      @err = stderr.read.strip
    end
    raise @err if @err != ""

    return @text
  end

  def self._get_source_content(source)
    if source =~ /^{\\rtf/
      return source
    elsif File.exists?(source)
      return File.open(source, 'r').read
    else
      raise "Source must be valid RTF or an existing file path."
    end
  end

  def self._clean_header(text)
    text.gsub!(/###  Translation.+(\n)?/, '')
    text.gsub!(/### font table .+\n\n/, '')
    text.gsub!(/-+\n\n/, '')
    return text
  end

  class << self
    private :_parse
    private :_get_source_content
    private :_clean_header
  end
end

# RtfParse
A ruby miodule wrapping unrtf. The GNU copmmand-line utility, unrtf, uses `.config` file to determine the output format for the parsed RTF. Output can be customized by modifying these files, which you'll find in the config directory of this gem. The `html.config` file includes a complete list of formatting tags.

## Dependencies
- [unrtf](https://www.gnu.org/software/unrtf/)

## Installation
First install unrtf:
- Mac: `brew install unrtf`
- Ubuntu: `apt-get install unrtf`
- Windows: [find installer here](http://gnuwin32.sourceforge.net/packages/unrtf.htm)

Then install the gem:
```ruby
gem install rtf_parse
```

## Use

```ruby
require 'rtf_parse'
```

To convert RTF to text:

```ruby
RtfParse.to_text(rtf_text_or_file_path)
```

To convert RTF to HTML:

```ruby
RtfParse.to_html(rtf_text_or_file_path)
```

To use a custom config file:

```ruby
RtfParse.custom_parse(rtf_text_or_file_path,
  config_path: 'path/to/config/files/',
  tags_file: 'custom_config_file_name'
)
```

# RtfParse
A ruby miodule wrapping the GNU copmmand-line utility unrtf

## Dependencies
- [unrtf](https://www.gnu.org/software/unrtf/)
- [OPen4](https://github.com/ahoward/open4)

## Usage
`require 'path/to/rtf_parse.rb'`

`RtfParse.to_text(rtf_text_or_file_path)`

`RtfParse.to_html(rtf_text_or_file_path)`

To use a custom config file:

`RtfParse.custom_parse(rtf_text_or_file_path, config_path: 'path/to/config/files/', tags_file: 'custom_config_file_name')`

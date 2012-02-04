require "bindata"

require_relative "swf/sbit"
require_relative "swf/ubit"

require_relative "swf/rect"

require_relative "swf/tag_wrapper"
require_relative "swf/tag"

Dir[File.join(File.dirname(__FILE__), 'swf', 'tags', '*.rb')].each do |tag|
  require tag
end

require_relative "swf/header"
require_relative "swf/stream"
require_relative "swf/file"
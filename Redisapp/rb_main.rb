#
#  rb_main.rb
#  Redisapp
#
#  Created by Steve Loveless on 1/22/14.
#  Copyright (c) 2014 Steve Loveless. All rights reserved.
#

require 'osx/cocoa'

def rb_main_init
  path = OSX::NSBundle.mainBundle.resourcePath.fileSystemRepresentation
  rbfiles = Dir.entries(path).select {|x| /\.rb\z/ =~ x}
  rbfiles -= [ File.basename(__FILE__) ]
  rbfiles.each do |path|
    require( File.basename(path) )
  end
end

rb_main_init

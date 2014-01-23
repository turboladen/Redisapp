#
#  AppDelegate.rb
#  Redisapp
#
#  Created by Steve Loveless on 1/22/14.
#  Copyright (c) 2014 Steve Loveless. All rights reserved.
#

class AppDelegate < OSX::NSObject
  include OSX

  def initialize
    @redis_path = '/usr/local/bin/redis-server'
    @redis_config = ' /usr/local/etc/redis.conf'
  end

  def applicationDidFinishLaunching_(notification)
    statusbar = NSStatusBar.systemStatusBar
    status_item = statusbar.statusItemWithLength(NSVariableStatusItemLength)
    redis_icon = NSImage.imageNamed_('dbs-redis_24x24x32.png')
    status_item.setImage(redis_icon)

    @redis_pid = fork do
      exec "#{@redis_path} #{@redis_config}"
    end

    puts "Forked process #{@redis_pid}"

    Process.detach(@redis_pid)
  end

  def applicationWillTerminate_(notification)
    puts "Killing redis process #{@redis_pid}"
    Process.kill('INT', @redis_pid)
  end
end


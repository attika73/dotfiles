#!/usr/bin/env ruby
require 'rubygems'
require 'wirble'
require 'irb/ext/save-history'

Wirble::Colorize::Color::COLORS.merge!({
  :blue => '0;35'
})

Wirble.init
Wirble.colorize

alias q exit

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
rvm_ruby_string = ENV["rvm_ruby_string"] || `rvm tools identifier`.strip.split("@", 2)[0]
@prompt = {
  :PROMPT_I => "#{rvm_ruby_string} > ",  # default prompt
  :PROMPT_S => "#{rvm_ruby_string} %l> ", # known continuation
  :PROMPT_C => "#{rvm_ruby_string} > ",
  :PROMPT_N => "#{rvm_ruby_string} ?> ", # unknown continuation
  :RETURN => " => %s \n",
  :AUTO_INDENT => true
}
IRB.conf[:PROMPT][:KFL62] = @prompt
IRB.conf[:PROMPT_MODE] = :KFL62

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

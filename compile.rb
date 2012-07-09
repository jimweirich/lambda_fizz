#!/usr/bin/env ruby

$show_defs = false
while ! ARGV.empty?
  arg = ARGV.shift
  if arg == '-d'
    $show_defs = true
  else
    fail "Unrecognized argument '#{arg}'"
  end
end

DEFINITIONS = {}
state = :reading
last_body = ''
last_name = nil

while line = gets
  line.chomp!
  line = line.gsub(/#.*$/,'')

  if line =~ /^ *([A-Z_]+) *= *(.*)$/
    name = $1
    body = $2
    state = :defining
    fail "#{name} already defined" if DEFINITIONS[name]
    DEFINITIONS[name] = body
    last_body = body
    last_name = name
  elsif state == :defining
    if line !~ /^ *$/
      last_body << line
    else
      state = :reading
    end
  end
end

DEFINITIONS.each do |name, body|
  body.gsub!(/ /,'')
end

program = DEFINITIONS[last_name]
while program =~ /([A-Z_]+)/
  name = $1
  program = program.gsub(/\b#{name}\b/, DEFINITIONS[name])
end

if $show_defs
  DEFINITIONS.each do |n, b|
    puts "#{n}=#{b}"
  end
else
  puts "require './interface'"
  puts "puts to_strings("
  puts program
  puts ")"
end

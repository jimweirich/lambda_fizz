#!/usr/bin/env ruby

require 'rake/clean'
require 'rake/testtask'
require 'ripper'
require 'sorcerer'

CLOBBER.include("cfb.rb", "cfb2.rb")

task :default => :spec

task :spec do
  sh "rspec ."
end

file "cfb.rb" => ["fizzbuzz.rb", "compile.rb"] do
  sh "ruby -I. compile.rb <fizzbuzz.rb >cfb.rb"
end

file "cfb2.rb" => ["cfb.rb"] do
  pgm = open("cfb.rb") do |f|
    f.gets
    f.gets
    f.gets
  end
  sexp = Ripper.sexp(pgm)
  src = Sorcerer.source(sexp, indent: true)
  open("cfb2.rb", "w") do |outs|
    outs.puts "require './interface'"
    outs.puts "puts to_strings("
    outs.puts src
    outs.puts ")"
  end
end

task :compile => ["cfb2.rb", "defs.rb"]

task "defs.rb" => [] do
  sh "ruby -I. compile.rb -d <fizzbuzz.rb >defs.rb"
end

module Convert
  def self.convert(ins, outs)
    lines = ins.readlines
    state = :docs

    while ! lines.empty?
      line = lines.shift

      case state
      when :docs
        pending_blank = false
        if line =~ /^[^#]{2}/
          outs.puts '<pre style="background: LightGray; padding: 5px;">'
          lines.unshift line
          state = :code
        else
          if line =~ /^#  /
            outs.puts "<pre>"
            lines.unshift line
            state = :pre
          else
            outs.puts docline(line)
          end
        end

      when :pre
        if line !~ /^#/
          outs.puts "</pre>"
          outs.puts if pending_blank
          lines.unshift line
          state = :docs
        else
          if line !~ /^#  /
            outs.puts '</pre>'
            outs.puts if pending_blank
            pending_blank = false
            lines.unshift line
            state = :docs
          elsif line =~ /^# *$/
            pending_blank = true
          else
            outs.puts if pending_blank
            pending_blank = false
            outs.puts docline(line)
          end
        end

      when :code
        if line =~ /^#/
          outs.puts '</pre>'
          outs.puts if pending_blank
          pending_blank = false
          lines.unshift line
          state = :docs
        elsif line =~ /^ *$/
          pending_blank = true
        else
          outs.puts if pending_blank
          outs.puts line
          pending_blank = false
        end
      end
    end
    outs.puts "</pre>" if state == :code || state == :pre
  end

  def self.docline(line)
    if line =~ /^#+$/
      ""
    elsif line =~ /^### /
      line.sub(/^###/,'h1. ')
    elsif line =~ /^## /
      line.sub(/^##/,'h2. ')
    else
      line.sub(/^# /,'')
    end
  end
end

file "README.textile" => "fizzbuzz.rb" do
  open("fizzbuzz.rb") do |ins|
    open("README.textile", "w") do |outs|
      Convert.convert(ins, outs)
    end
  end
end

# coding: utf-8
names = ["xxx", "yyy", "qqq"]

names.each(&:capitalize!)
names.each { |e| puts e[0] }
puts names


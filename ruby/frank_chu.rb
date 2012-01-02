#!/usr/bin/ruby

#this script generates a Frank Chu Sign 

#set up the word banks
Line1 = ['phillips', 'williamsburg', 'hilgendorf', 'cameron', 'cleverley', 'harrington', 'elmsford', 'waldman'] #Place name, small towns, strange sounding, light blue

Line2 = ['galaxies', 'populations', 'galaxies']

Line3 = ['vesfrodrenical', 'whutrogrenikol', 'addikenical', 'psychrozenical', 'cesjrogrenical', 'kextokjnetul', 'shaxjrodrenikel', 'jretrostrenikal']
Line3a = ['incarnations', 'octogenarian', 'adversity', 'dissensions', 'ergonomics', 'obsessions', 'forclosures', 'exhibitions']

Line4 = ['BBC', 'ABC', 'CNN', 'NBC', 'CBS', 'PBS', '20/20', 'FOX', 'global']
Line4a = ['psychotechno', 'juxtagronikul', 'gutsprosenical', 'xoxphroxenigul', 'kastronoticul', 'sysfrofonical', 'thatrocenical']
Line4b = ['podcasts', 'coverage', 'netcasts', 'broadcasts', 'content']

Line5 = ['trykrowronikul', 'kisprogenical', 'ovolutions eperational', 'zagocenikul', 'guskoketical', 'whetrosenikul', 'wisgrovenikul', 'kisprogenical', 'phixgrostrenikul']

Line6 = []

lines = [ Line1, Line2, Line3, Line4, Line5 ]

#set up the color and formattting
def chucolor(text, color_code)
  "\e[1;#{color_code};40m#{text}\e[0m"
end

def red(text); chucolor(text, 31); end
def green(text); chucolor(text, 32); end
def blue(text); chucolor(text, 34); end
def magenta(text); chucolor(text, 35); end
def cyan(text); chucolor(text, 36); end
def white(text); chucolor(text,37); end

#select one element from array and format it
def pick(array)
  array[rand(array.length)].upcase
end

#constructs each line of the sign according to observed patterns
def build_line(array)
  line = pick(array)
    #Line1
    if array == Line1
      return cyan(line)
    #Line2
    elsif array == Line2
      output = rand(1000).to_s + "0000000 " + line
      return white(output)
    #Line3
    elsif array == Line3
      output = line + ' ' + pick(Line3a)
      return green(output)
    #Line4
    elsif array == Line4
      output = line + ' : ' + pick(Line4a) + ' ' + pick(Line4b)
      color = rand(3)
      if color == 0
        return red(output)
      elsif color == 1
        return cyan(output)
      elsif color == 2
        return magenta(output)
      end
    #line5
    elsif array == Line5
      return white(line)
    #Line6
    elsif array == Line6
      return line
    #Line7
    elsif array == Line7
      return line
  end
end

#pushes each array through the grinder and outputs the sign
lines.each { |line| puts build_line(line).center(60)}

#there's no step 3!
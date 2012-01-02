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

Line6 = ['apertures', 'lucritive', 'miniscule','epitomized', 'statutory', 'nascent', 'parochial']
Line6a = ['ultracompacts', 'partisans', 'admonishments', 'incentives', 'syncing', 'reticence', 'astro-physicists', 'libertarians']

Line7 = ['awetrocenial', 'moratoriums', 'stratospherical',  'agrithenical', 'tetrafluoride', 'apologetics', 'astrocenial', 'pedophiles', 'biostatisticians', 'epitomes']

lines = [ Line1, Line2, Line3, Line4, Line5, Line6, Line7 ]

#set up the text and background color
def chucolor(text, color_code)
  "\e[1;#{color_code};40m#{text}\e[0m"
end

def red(text); chucolor(text, 31); end
def green(text); chucolor(text, 32); end
def blue(text); chucolor(text, 34); end
def magenta(text); chucolor(text, 35); end
def cyan(text); chucolor(text, 36); end
def white(text); chucolor(text,37); end

#select one element from an array and format it
def pick(array)
  array[rand(array.length)].upcase
end

#constructs each line of the sign according to observed patterns
def build_line(array)
  line = pick(array)
    if(array == Line1); return cyan(line); end
    if(array == Line2)
      output = rand(1000).to_s + "0000000 " + line
      return white(output)
    end
    if(array == Line3)
      output = line + ' ' + pick(Line3a)
      return green(output)
    end
    if(array == Line4)
      output = line + ' : ' + pick(Line4a) + ' ' + pick(Line4b)
      color = rand(3)
      if(color == 0); return red(output); end
      if(color == 1); return cyan(output); end
      if(color == 2); return magenta(output); end
    end
    if(array == Line6)
      i = rand(3)
      if(i == 0); output = line + ' ' + pick(Line6a); end
      if(i == 1); output = pick(Line6a) + ' ' + line; end
      if(i == 2); output = line; end
      color = rand(3)
      if(color == 0); return red(output); end
      if(color == 1); return blue(output); end
      if(color == 2); return green(output); end
    end   
    if(array == Line5 || Line7) ; return white(line); end
end

#pushes each array through the grinder and outputs the sign
lines.each { |line| puts build_line(line).center(60)}

#there's no step 3!
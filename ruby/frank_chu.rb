#!/usr/bin/ruby

#this script generates a Frank Chu Sign 

#set up the word banks
Line1 = ['phillips', 'crawley', 'williamsburg', 'plymouth', 'hilgendorf', 'telford', 'dudley', 'cameron', 'cleverley', 'harrington', 'elmsford', 'waldman']

Line2 = ['galaxies', 'populations', 'galaxies']

Line3 = ['incarnations', 'octogenarian', 'adversity', 'dissensions', 'ergonomics', 'obsessions', 'forclosures', 'exhibitions']

Line4 = ['BBC', 'ABC', 'CNN', 'NBC', 'CBS', 'PBS', '20/20', 'FOX', 'global']
Line4a = ['podcasts', 'coverage', 'netcasts', 'broadcasts', 'content', 'spaceports', 'civilians', '']

Line5 = ['']

Line6 = ['apertures', 'lucritive', 'miniscule','epitomized', 'statutory', 'nascent', 'parochial']
Line6a = ['ultracompacts', 'partisans', 'admonishments', 'incentives', 'syncing', 'reticence', 'astro-physicists', 'libertarians']

Line7 = ['awetrocenial', 'moratoriums', 'stratospherical',  'agrithenical', 'tetrafluoride', 'apologetics', 'astrocenial', 'pedophiles', 'biostatisticians', 'epitomes']

lines = [ Line1, Line2, Line3, Line4, Line5, Line6, Line7 ]


  
#set up the text and background colors
def colorize(text, color_code)
  "\e[1;#{color_code};40m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end
def blue(text); colorize(text, 34); end
def magenta(text); colorize(text, 35); end
def cyan(text); colorize(text, 36); end
def white(text); colorize(text,37); end

#select one element from an array and format it
def pick(array)
  array[rand(array.length)].upcase
end

#chu-ism generator
def chuism()
  prefix = ['ves', 'whu', 'add', 'psy', 'ces', 'shax', 'kex', 'jre', 'za', 'jux', 'guts', 'xox', 'kas', 'tha', 'wis', 'kis', 'gus']
  fix = ['for', 'tro', 'cro', 'jro', 'to', 'go', 'ta', 'pro', 'phro', 'tro', 'gro']
  midfix = ['dren', 'gren', 'ken', 'zen', 'jn', 'stren', 'gron', 'sen', 'xen', 'not', 'cen', 'ven' 'bren']
  suffix = [ 'ikul', 'ical', 'icul', 'ikol', 'ikel', 'etul', 'ikal']
  return  pick(prefix) + pick(fix) + pick(midfix) + pick(suffix)
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
      output = chuism() + ' ' + line
      return green(output)
    end
    if(array == Line4)
      output = line + ' : ' + chuism() + ' ' + pick(Line4a)
      color = rand(3)
      if(color == 0); return red(output); end
      if(color == 1); return cyan(output); end
      if(color == 2); return magenta(output); end
    end
    if(array == Line5)
      output = chuism()
      return white(output)
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
    if(array == Line7) ; return white(line); end
end

#pushes each array through the grinder and outputs the sign
lines.each { |line| puts build_line(line).center(60)}

#there's no step 3!
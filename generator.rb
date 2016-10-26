# Copyright (c) 2015 StackMechanic Limited
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#  
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'sass'
require 'erb'

STYLE = 'style.sass'
PAGE = 'index.html'
OUTDIR = 'docs'
COMPANY_NAME = 'StackMechanic'

# make the style
def getStyle

    return Sass::Engine.new(File.new(STYLE, "r").read, {syntax: :sass, style: :compressed}).render

end

# the year today
def getYear

    return Date.today.year.to_s
    
end

# run embedded code on the page
result = ERB.new(File.new(PAGE, "r").read).result

# write to output
f = File.new("#{OUTDIR}/#{PAGE}", "w")
f.puts(result)
f.close

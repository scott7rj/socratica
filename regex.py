import re

text_to_search = '''
abcdefghijklmnopqurtuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890

Ha HaHa

MetaCharacters (Need to be escaped):
.[{()\^$|?*+

coreyms.com

cat
mat
pat
bat

321--555-4321
321-555-4321
123.555.1234
123*555.1234
800-555.1234
900-555.1234

Mr. Schafer
Mr Smith
Ms Davis
Mrs. Robinson
Mr. T

[89]00[-.]\d\d\d[-.]\d\d\d\d
[a-zA-Z]
[^b]at
\d{3}.\d{3}.\d{4}
Mr\.?\s[A-Z]\w*
M(r|s|rs)\.?\s[A-Z]\w*

MauroYArima@gmail.com
mauro.arima@university.edu
mauro-123-arima@my-work.net
[a-zA-Z0-9.-]+@[a-zA-Z-]+\.(com|edu|net)

https://www.google.com
http://coreyms.com
https://youtube.com
https://www.nasa.gov
'''

sentence = "Start a sequence and then bring it to an end"

pattern = re.compile(r'abc')
matches = pattern.finditer(text_to_search)
for match in matches:
    print(match)
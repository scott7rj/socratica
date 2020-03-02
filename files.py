#help(open)

f = open("c:\\tmp\\pws\\guido_bio.txt")
text = f.read()
f.close()

try:
    with open("c:\\tmp\\pws\\guido_bio.txt") as fobj:
        bio = fobj.read()
except FileNotFoundError:
    bio = None

oceans = ["Pacific","Atlantic","Indian","Southern","Arctic"]
#with open("c:\\tmp\\pws\\oceans.txt", "w") as f:
#    for ocean in oceans:
#        f.write(ocean)
#        f.write("\n")
with open("c:\\tmp\\pws\\oceans.txt", "w") as f:
    for ocean in oceans:
        print(ocean, file=f)

with open("c:\\tmp\\pws\\oceans.txt", "a") as f:
    print(23*"=", file=f)
    print("These are the 5 oceans", file=f)

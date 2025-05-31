f=open("FRUITS.txt","a")
f.write("apple\n")
f.write("orange\n")
f.close()

f=open("FRUITS.txt","r+")
print(f.readline())

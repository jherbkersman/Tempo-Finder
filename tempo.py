import time
print("Hi, welcome to Jack's tempo finder. Tap ENTER repeatedly at your desired BPM and I will give you a tempo estimate. To stop, press any key and then ENTER.")
x = ''
tempo = ''
intervals = []
x = input("Tempo (BPM):")
while x == '':
	start = time.time()
	x = input(tempo)
	end = time.time()
	if len(intervals) <= 10:
		intervals.append(60/(end-start))
	else:
		intervals.pop(0)
		intervals.append(60/(end-start))
	tempo = round(sum(intervals)/len(intervals))
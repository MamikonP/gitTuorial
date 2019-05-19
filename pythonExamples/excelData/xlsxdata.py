#!/usr/bin/python3

#	TASK	#
#	Read the .txt file and write in .xlsx file with argparse

try:
	import xlsxwriter
	import argparse
except ImportError:
	print("No such module")


parse = argparse.ArgumentParser()
parse.add_argument('-f', '--file', required = True, help = '(-f/--file) filename.txt')
parse.add_argument('-d', '--document', required = True, help = '(-d/--document) filename.xlsx')
args = vars(parse.parse_args())

workbook = xlsxwriter.Workbook(args["document"])
worksheet = workbook.add_worksheet()

cell_format = workbook.add_format({'bg_color':'red'})

f = open(args["file"])
k = f.readlines()
index = 1
for i in range(len(k)):
	ml = list()
	print(k[i])
	ml = k[i].split()
	print(ml)
	if (ml[3].upper() == 'PROGRAMMER'):
		worksheet.write('A'+str(index), ml[0], cell_format)
		worksheet.write('B'+str(index), ml[1], cell_format)
		worksheet.write('C'+str(index), ml[2], cell_format)
		worksheet.write('D'+str(index), ml[3], cell_format)
	else:
		worksheet.write('A'+str(index), ml[0])
		worksheet.write('B'+str(index), ml[1])
		worksheet.write('C'+str(index), ml[2])
		worksheet.write('D'+str(index), ml[3])
	index += 1
	
workbook.close()

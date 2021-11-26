import os
import argparse

parser = argparse.ArgumentParser(description='set up input file list (generate comma separate file list)')
parser.add_argument('-i',required=True,help='location of input reads')
parser.add_argument('-o',required=False,default= "no", help='name of output folder')
parser.add_argument('-e',required=False,default= ".fq",help='file extention name')
parser.add_argument('-s',required=False,default= ",",help='file separater')
parser.add_argument('-p',required=True,help='name of plant')

args = vars(parser.parse_args())




path = args["i"] + "/"



if args["o"] == "no":
        path1 = args["i"] + "/"
else:
        path1 = args["o"] + "/"

file_list = os.listdir(path)

if args["s"] == "s":
        sep = " "
else:
        sep = args["s"]


R1_list =[]
R2_list = []
for f in file_list:
        if args["p"] in f:
                if "R1" in f:
                        name = f.split(".")
                        name_1 = name[0]
                        name_2 = name[1]
                        name_1 = name_1.split("_")
                        name_2 = name_2.split("_")
                        name_1[5] = "R2"
                        name_2[2] = "2"
                        R1_list.append(path1 + f)
                        R2_list.append(path1 + "_".join(name_1) + "." + "_".join(name_2) + args["e"])


R1_file_list = sep.join(R1_list)
R2_file_list = sep.join(R2_list)
print(R1_file_list)
print("\n")
print(R2_file_list)

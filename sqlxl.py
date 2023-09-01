
# FILE:     maker.py
# DATE:     2021-04-10
# AUTHOR:   Liam Easton
# DESCRIPTION:
#       Data Dictionary -> Database Creation
#

import datetime
import os
import shutil
import re

def main():
    """ Program starts here """
    print('	*** Database maker ***')

    # get the name of the dictionary
    dictionary_name = input("What is the name of your Data Dictionary?\n")
    
    # get the date
    program_date = datetime.datetime.now().strftime("%Y")

    description = input("What's your project about description? ")

    # Let the user know the program finished
    input("Done! Press enter to continue")

    # build the file name
    sql_file = dictionary_name.replace(' ', '_') + ".sql"
    csv_file = sql_file.replace("sql", 'csv')


    # Open the file and save the file handle to a variable
    the_file = open(sql_file, "a")

    # 2 Write the elements of the file
    the_file.write('/*\nFILE: ' + sql_file + '\n')
    the_file.write('DATE: ' + program_date + '\n')
    the_file.write('AUTHOR: Liam Easton\n')
    the_file.write('Description\n')
    the_file.write('\t ' + description + '\n*/\n')
    the_file.write(
        '/*******************************************************************************/\n')
    the_file.write('\n')
    the_file.write('-- Standard pattern for creating a database.\n')

    the_file.write('DROP DATABASE IF EXISTS ' + dictionary_name + ';\n')
    the_file.write('CREATE DATABASE ' + dictionary_name + ';\n')
    the_file.write('USE ' + dictionary_name + ';\n')
    the_file.write('\n')
    the_file.write('/* **************************************************************************** \n \t Building table \n ***************************************************************************** */')

    # Copy the CSV file to the SQL file
    shutil.copyfile(csv_file, sql_file)


    # with auto-closes the file and r+ is read and write within the file
    with open('Segway.sql', 'r+') as f:
        content = f.read()
        content = content.replace(',,,,,,,,,,,,,,', '\n')
        parentheses = re.findall("\((.*?)\)", content)
        content = content.replace()
        
        f.seek(0)
        f.write(content)
        f.truncate()

# run the main() function
main()


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
    dictionary_name = "Segway"
    #input("What is the name of your Data Dictionary?\n")
    
    # get the date
    program_date = datetime.datetime.now().strftime("%Y")

    description = ""
    #input("What's your project about description? ")

    # Let the user know the program finished
    #input("Done! Press enter to continue")

    # build the file name
    sql_file = dictionary_name.replace(' ', '_') + ".sql"
    csv_file = sql_file.replace("sql", 'csv')


    # Open the file and save the file handle to a variable
    the_file = open(sql_file, "w")

    # 2 Write the elements of the file

    '''
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
    the_file.write('/* **************************************************************************** \n \t Building table */')
    the_file.write('\n')
    the_file.write('\n')
    '''

    # Open the csv file for reading
    with open(csv_file, 'r+') as csv:
        content1 = csv.read()

    # Open the sql file for appending (use 'a' mode)
    with open(sql_file, 'w') as sql:

    # Write the content of the first file to the second file
        sql.write(content1) 

    # with auto-closes the file and r+ is read and write within the file
    with open('Segway.sql', 'r+') as f:
        content = f.read()
        content = content.replace(',,,,,,,,,,,,,,', '\n')        
        content = content.replace('\n\n\n', '\n***************************************************************************** */ \nDROP TABLE IF EXISTS ')
        content = content.replace('\n\n', ';\nCREATE TABLE(')
        content = re.sub(r'\([^)]*\)', '', content)
        content = content.replace(',', ' ')
        content = content.replace('             ', ';\nCREATE TABLE(')
        content = content.replace('\n\n', ';\nCREATE TABLE(')
        content = re.sub(r'\.(?!\S)', '.\n;\n\n/* *****************************************************************************\n\tBuilding table', content)
        #content = content.replace('\n', '')
        #content = content.replace('nvarchar\n', 'nvarchar(')
        f.seek(0)
        f.write(content)



    

# run the main() function
main()

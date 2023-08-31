
# FILE:     maker.py
# DATE:     2021-04-10
# AUTHOR:   Class
# DESCRIPTION:
#       We'll get to that in a moment.
#

import datetime
import os


def main():
    """ Program starts here """
    print('	*** database maker ***')
    # get the name of the program
    program_name = input("Please enter the program name: ")

    # get the date
    program_date = datetime.datetime.now().strftime("%Y")

    database_name = input("What is your database name? ")
    description = input("What is your description? ")

    field_name = input("What is the field name? ")
    table_name = input("What is your table name? ")

    # check for NULL or NOT NULL
    null_value = 0
    user_null = input('Type \'y\' if NULL: ')
    if (user_null == 'y'):
        null_value = 'NULL'
    else:
        null_value = 'NOT NULL'

    # check for AUTO_INCREMENT
    autoinc = 0
    autoincrement = input('Type \'y\' if Auto-incrementing: ')
    if (autoincrement == 'y'):
        autoinc = 'AUTO_INCREMENT '
    else:
        autoinc = ''

    # check for UNIQUE
    uni = 0
    useruni = input('Type \'y\' if UNIQUE: ')
    if (useruni == 'y'):
        uni = 'UNIQUE '
    else:
        uni = ''

    # do the null thing with unique and auto increment and default

    # Looking at the datatype
    datatype = input("What is the datatype? ")
    # check varchar number
    if (datatype == 'varchar' or 'VARCHAR'):
        varchar_int = input("How many characters do you want? ")
        varchar_final ='(' + varchar_int + ')'
    else:
        varchar_final = ''



    # value = input("What is the value? ")
    # field_description = input("What is the field description? ")
    # other_field_definition = input("What is the other field definition? ")
    # field = input("What is the field name? ")
    # other_field_list = input("What is the other field list? ")
    # constraint_name = input("What is the constraint name? ")
    # local_field_name = input("What is the local field name? ")
    # other_table = input("What is the other table named? ")
    # other_table_field_name = input("What is the other table field name? ")
    # other_constraints_as_needed = input("What is the other constraints? ")
    table_comment = input("What is the table comment? ")
    # Let the user know the program finished
    input("Done! Press enter to continue")
    # build the file name
    file_name = program_name.replace(' ', '_') + ".sql"
    # write the file
    # 1) Open the file and save the file handle to a variable
    the_file = open(file_name, "w")

    # 2) Write the elements of the file
    the_file.write('/*\nFILE: ' + file_name + '\n')
    the_file.write('DATE: ' + program_date + '\n')
    the_file.write('AUTHOR: Liam Easton\n')
    the_file.write('Description\n')
    the_file.write('\t ' + description + '\n*/\n')
    the_file.write(
        '/*******************************************************************************/\n')
    the_file.write('-- Standard pattern for creating a database.\n')

    the_file.write('DROP DATABASE IF EXISTS ' + database_name + ';\n')
    the_file.write('CREATE DATABASE ' + database_name + ';\n')
    the_file.write('USE ' + database_name + ';\n')

    the_file.write('DROP TABLE IF EXISTS ' + table_name + ';\n')
    the_file.write('CREATE TABLE ' + table_name + '\n')
    the_file.write('\t' + field_name + ' ' + datatype.upper() + varchar_final +
                   ' ' + null_value + ' ' + uni + autoinc)

    #                 + field_description + '\'  [, ' + other_field_definition + ']\n')
    # the_file.write('\t, PRIMARY KEY(' + field +
    #                ' [, ' + other_field_list + '])\n')
    # the_file.write('\t[, CONSTRAINT fk_' + constraint_name + ' \n')
    # the_file.write('\tFOREIGN KEY (' + local_field_name + ')\n')
    # the_file.write('\tREFERENCES ' + other_table +
    #                ' (' + other_table_field_name + ')]\n')
    # the_file.write('\t[, ' + other_constraints_as_needed + ']\n')


    the_file.write(') COMMENT \' ' + table_comment + ' \'\n;\n\n')


# run the main() function
main()

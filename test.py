import csv

# Specify the path to your input CSV file
input_csv_file = 'Segway.csv'

# Read the input data from the CSV file
with open(input_csv_file, 'r', newline='') as csvfile:

    csv_reader = csv.reader(csvfile)
    
    # Initialize SQL script
    sql_script = ""

    # Initialize table name
    table_name = None

    # Process each row of data in the CSV file
    for row in csv_reader:
        # Check if a new table is defined based on specific criteria
        if len(row) > 1 and row[0].strip() and row[1].strip() == '(lookup table)':
            if table_name:
                sql_script += ');\n\n'
            table_name = row[0].strip()
            sql_script += f"CREATE TABLE {table_name} (\n"
        elif len(row) > 1 and row[0].strip():
            column_name = row[0].strip()
            datatype = row[1].strip()
            length = row[2].strip() if row[2].strip() else "MAX"
            nulls = "NOT NULL" if row[7].strip() == "no" else ""
            default = f"DEFAULT {row[3].strip()}" if row[3].strip() else ""
            increment = f"IDENTITY({row[5].strip()}, {row[6].strip()})" if row[4].strip() == "yes" else ""
            comments = f"/* {row[-1].strip()} */" if row[-1].strip() else ""
            sql_script += f"  {column_name} {datatype}({length}) {nulls} {default} {increment}, {comments}\n"

    # Add the closing parenthesis and semicolon for the last table
    if table_name:
        sql_script += ');\n'

# Specify the path for the output SQL file
output_sql_file = 'output.sql'

# Write the generated SQL script to the output SQL file
with open(output_sql_file, 'w') as sqlfile:
    sqlfile.write('/*\nFILE: ' + 'Segway' + '\n')
    sqlfile.write('DATE: \n')
    sqlfile.write('AUTHOR: Liam Easton\n')
    sqlfile.write('Description\n')
    sqlfile.write('\t \n*/\n')
    sqlfile.write(
        '/*******************************************************************************/\n')
    sqlfile.write('\n')
    sqlfile.write('-- Standard pattern for creating a database.\n')

    sqlfile.write('DROP DATABASE IF EXISTS ;\n')
    sqlfile.write('CREATE DATABASE ;\n')
    sqlfile.write('USE ;\n')
    sqlfile.write('\n')
    sqlfile.write('/* **************************************************************************** \n \t Building table */')
    sqlfile.write('\n')
    sqlfile.write('\n')
    sqlfile.write(sql_script)

print(f"SQL script has been written to '{output_sql_file}'.")
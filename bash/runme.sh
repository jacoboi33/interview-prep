#!/bin/bash

# Function to manipulate CSV data
manipulate_csv() {
    # Replace all occurrences of "old_value" with "new_value" in the CSV file
    sed -i 's/old_value/new_value/g' "$1"

    # Add a new column "new_column" with a default value in the CSV file
    sed -i '1s/$/,new_column/' "$1"
    sed -i '2,$s/$/,default_value/' "$1"

    # Remove rows that match a specific pattern in the CSV file
    sed -i '/pattern/d' "$1"
}

# Run the manipulation function on each CSV file
for file in /path/to/csv/files/*.csv; do
    manipulate_csv "$file"
done

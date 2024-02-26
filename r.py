import pandas as pd

# Read the CSV file
df = pd.read_csv('your_file.csv')

# Convert the date column to datetime format
df['datecolumn'] = pd.to_datetime(df['datecolumn'], format='%m-%d-%Y %H:%M:%S')

# Convert the date format to year-month-day
df['datecolumn'] = df['datecolumn'].dt.strftime('%Y-%m-%d')

# List of dates to remove
dates_to_remove = ['2024-01-01', '2024-01-05', '2024-01-10']  # Example dates

# Remove rows where date matches any date in dates_to_remove
df = df[~df['datecolumn'].isin(dates_to_remove)]

# Save the modified DataFrame to a new CSV file
df.to_csv('new_file.csv', index=False)

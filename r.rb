import pandas as pd
import jpholiday

# Read the CSV file
df = pd.read_csv('your_file.csv')

# Convert the date column to datetime format
df['datecolumn'] = pd.to_datetime(df['datecolumn'], format='%m-%d-%Y %H:%M:%S')

# Convert the date format to year-month-day
df['datecolumn'] = df['datecolumn'].dt.strftime('%Y-%m-%d')

# Get a list of Japanese holidays for a specific range of dates
start_date = '2024-01-01'
end_date = '2024-12-31'
japanese_holidays = [str(date) for date in jpholiday.between(start_date, end_date)]

# Remove rows where date matches any date in japanese_holidays
df = df[~df['datecolumn'].isin(japanese_holidays)]

# Save the modified DataFrame to a new CSV file
df.to_csv('new_file.csv', index=False)

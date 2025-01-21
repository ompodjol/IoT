from datetime import datetime, timedelta

# Define the key dates
start_date = datetime(2025, 1, 11)
end_date = datetime(2025, 7, 25)

# Calculate the total days between the dates
total_days = (end_date - start_date).days

# Define the target and current amounts
current_money = 35000
target_money = 100000
money_to_raise = target_money - current_money

# Calculate the daily amount needed
daily_amount = money_to_raise / total_days

print("Remaining Days until GA", total_days)
print("Daily Amount to save in SEK: ", daily_amount)
print("Monthly Amount to save in SEK: ", daily_amount * 30)

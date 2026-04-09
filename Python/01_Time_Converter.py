def convert_minutes(minutes):
    if minutes < 0:
        return "Invalid input (minutes cannot be negative)"

    hours = minutes // 60
    remaining = minutes % 60
    return f"{hours} hrs {remaining} minutes"

minutes = int(input("Enter total minutes: "))
result = convert_minutes(minutes)

print(result)
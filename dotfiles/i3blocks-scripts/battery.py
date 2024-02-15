import subprocess

result = subprocess.run(["acpi"], shell=True , capture_output=True, text=True)
result = result.stdout.split(",")[1]
print(result)

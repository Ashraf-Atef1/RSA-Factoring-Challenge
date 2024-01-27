import os

def get_great_grandparent_pid():
    # Get the current process ID
    current_pid = os.getpid()

    # Get the parent process ID
    parent_pid = os.getppid()

    # Update the current process ID to be the parent process ID
    current_pid = parent_pid

    # Get the grandparent process ID
    grandparent_pid = os.getppid()

    return grandparent_pid

# Get the great-grandparent process ID
great_grandparent_pid = get_great_grandparent_pid()

print(f"Great-Grandparent Process ID: {great_grandparent_pid}")
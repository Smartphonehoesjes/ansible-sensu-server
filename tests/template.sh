#check ports
ansible all -i "localhost," -c local -m template -a "src=mailer.j2 dest=./test.txt" --extra-vars='@tests/gh128-multiple-mailer-handlers.yml' && cat test.txt


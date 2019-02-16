#! /bin/bash

nelson_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGRQC/sE0vHrGks3IYjuVxBbyEASasxYcCmiaAqkKKTaj3Nrit2gmL9k0g9KmauZu2j81rV6aMwaEcF6ygorzZQ8XDtO7HjgmaW+8/T58mE8DaOaOZc3RRthovbkDlgVL6OBymOuyUn/2ny1pF+St3VBf9mUUwinnBmg0CCm5qsNC0++SymMJ01JICqxrMVFuMADDCRVrUQUUwcsauOApSDQRQ1p05acXDzP5g6Sgwz38WJqB3PYGLCEn46PB9bWn7RdkEs7P6dWzNpoZgfAvA7k+q4XIk3FA7UpeTKUdF8CXl/rtDMVHA9429K4HPZweO28meLrps7+jcy61DMQoURccqwQxEWsf/dWJG0oY3ncy1WtvQm/319pbTX2m0Yej8sbjBItALGYHdBqSYz5WbjCXdnAtE2uu1B+PcNtzTazNZQKDxSiysbTAnRFt47Z50UhVPqbb1TqGsEUUy7qJ0IrC00JW1ZHNdJFoH5RVwH8nfWbnPoRr5hQSjondXwMMeyBxJ0YwGXOyix1iJi+j1BwweOHBZtT8uRyIHe0sJdmeCtda5udc3xKVApuj0BcNRkZe7j1DyV5OzMOAtExJ4ziiPh3nv5fv138s0ZPyvOUh5wO/BSIFcJjDLrXr0abbfaBYOUXC+oi9AKyNkrgfSsrPaNZsBVJDS36/0Qlca0w== nelsonfigueroa07@gmail.com'
sol_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlfiPkVaeVdkudtzbtBY2VFqhtdraZPArZfOUDE5LOPvSHkBZ1sjgRP+9MOG1mZ7vX9lLrom7Nj5o6JgAZPlrX5f1TaWf81qY55IoX9ATFgktZZIwIYeonkVCoihNsLqmbN1C23ji0EqH8wYqGLWFhZXpsB+JlnKkYJBoA51XU+VAH66rfyabdODZnwB2Jv2ArPuw+n5b1csb5aIfFwHWGHsCwRtSdNvbm/UGtZvPY3Vi1+p93InaICNdiSf1rA7h0GK9Zjz6qUjPVM57i51VDObWHzTCKXidY3KKwhejdrY5lpI+vS9qcfiTFxck3RHy5q7Nv0s7bFYg0FAmwWm4uQ== rsa-key-20190209'
mark_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA7EYYOzBOWpCStCMzh6q87LSCYSVvSitykubvCNYQwjFf3or71IgbB2PIL4xee/vFwkkj4Ue8tZxz+7Lip4qSUdIbv4/T7r/wFXtgVfRuwix5l4IxkZ1/8mdRoJMWcqJp+TrG5nRy5kQqb6rmXW/AVmRJdqP5KCA8s+a4UrQFL3OeODSEMOUx1IYSMceAVMcYOHqFtso4T+oOnNoQ/YtQr886QTyaPQwCYHMI26GyfNioo+y5R/uA0vzxmA4cUEo0cefdYBo9tOU5ChL9ftwXG+boWG64PjbNnCLbx+BG1yu8QlcF/5bwXmstsEUmrN5k2qrrqgp2Ehj00iza7ZGr7Q== rsa-key-20190209'
greg_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8s0vJu5cdn0vsNkcZPs3yIqWQQtlXgRTbPoPK1cMud2DGbVN4PhJPnN45CLmB1cxfqa65JIx+CRp/NMQNGko/QRY5aW5ktnNkXZfSt25Mr/N4pJYzrbDaAerpcwqmkjOWT5iIPCwztni//BsovUdSF6ExY5tnaJf2sDzC+qhD2FFfdmIoe/+ZKcAyDofUKTnbLQUCQkSrmysMChtEiUtj8FKwyE6FMIEwCznjLzkwBuCjnbtimncpwiZ71Pkk927dtIHDTG6D9xnFlkH2B40QQmrBCU5gOOhefcviweHUC3DZ+zJohVc1ajDuc6NCrSRC5g9vgg/14tL2r0jF2FMP GregTK@MacBook-Pro.local'
ryan_pub_key=''
jeff_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDa3la5HHl700j8YRGU+hgWkaj2ZtYnJAZArwV5W4An/zZt6k4gr3xnLbi5MPOJkT+jIGiCZzgjXJv+BciPZ8iz/ES88gJJEGCsT+F3lQByfAkTjSpHzUd59h6oyll8ZtYU7Vr5Cw+MXO4vqkyiiYb4CZ5m7o0nCEKbUiQdbTgb9hufo1LAurmXis3Qdm7kegGxibflQWAjXCDRFH2LnV+N1+AV1fghq0t/ZuIwxW2VkOlWppoLBtalJ+Kknmp1/ZzTjHMZ1fq4JGxvJ1K7QwALJb7rqA9ay1/LYT7zW784hzh3gA913blGWtdolMa6zDT/mLNZRNmXMP1fSkPyzK6r imported-openssh-key'
aaron_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAiubTDQJoz+tHMydMfYwgRmdqMnT3SzmOOJroXH8yLQ4RSqTmvjsVJON/WtEtcwHmB8r5BM0DGAJpxQAvlf6OqZ2Q146uuK3Q9kZ4Cd1RZYHtLvYb+rUvSvaOQiuw56ZMmLsNBREe1lCzT6q2UaQEO+CFpk0jhYLJ9W3ViC7770+qDIp0Lht/EtjQY+RWkQ19oh22g2YU5K1pWGg1fdSW4y/qBJcevE5eyoKIiJ9XaO+uYLqK/SnQBB7ULQpSgDcHOYn36tZm4xTz+/EVDYDBKksBvS9DLEz7ehx/Qv+s4dhfMztT0l58ctF0Qd4A3U7aQkrtw6b1IQQiXhXT0g5AXw== rsa-key-20190216'

users=('nelson' 'sol' 'mark' 'greg' 'ryan' 'jeff' 'aaron')

for i in "${users[@]}"
do
  : 
  # create user
  adduser $i

  # create default password
  echo "$i:password" | chpasswd

  # force user to create new password on logon
  sudo passwd --expire $i

  # add to sudoers group
  usermod -aG sudo $i

  # create .ssh directory
  mkdir "/home/$i/.ssh"

  # copy keys to authorized_keys file
  # assign user_pub_key string to 'key'
  key="${i}_pub_key"
  # get actual value of variable user_pub_key as opposed to the string itself by using !
  echo "${!key}" >> "/home/$i/.ssh/authorized_keys"
done

# restart sshd service
systemctl restart sshd

# include sshd_config stuff, NOT ssh_config

# delete user
# sudo deluser --remove-home username
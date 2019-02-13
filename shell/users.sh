#! /bin/bash

nelson_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGRQC/sE0vHrGks3IYjuVxBbyEASasxYcCmiaAqkKKTaj3Nrit2gmL9k0g9KmauZu2j81rV6aMwaEcF6ygorzZQ8XDtO7HjgmaW+8/T58mE8DaOaOZc3RRthovbkDlgVL6OBymOuyUn/2ny1pF+St3VBf9mUUwinnBmg0CCm5qsNC0++SymMJ01JICqxrMVFuMADDCRVrUQUUwcsauOApSDQRQ1p05acXDzP5g6Sgwz38WJqB3PYGLCEn46PB9bWn7RdkEs7P6dWzNpoZgfAvA7k+q4XIk3FA7UpeTKUdF8CXl/rtDMVHA9429K4HPZweO28meLrps7+jcy61DMQoURccqwQxEWsf/dWJG0oY3ncy1WtvQm/319pbTX2m0Yej8sbjBItALGYHdBqSYz5WbjCXdnAtE2uu1B+PcNtzTazNZQKDxSiysbTAnRFt47Z50UhVPqbb1TqGsEUUy7qJ0IrC00JW1ZHNdJFoH5RVwH8nfWbnPoRr5hQSjondXwMMeyBxJ0YwGXOyix1iJi+j1BwweOHBZtT8uRyIHe0sJdmeCtda5udc3xKVApuj0BcNRkZe7j1DyV5OzMOAtExJ4ziiPh3nv5fv138s0ZPyvOUh5wO/BSIFcJjDLrXr0abbfaBYOUXC+oi9AKyNkrgfSsrPaNZsBVJDS36/0Qlca0w== nelsonfigueroa07@gmail.com'
sol_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlfiPkVaeVdkudtzbtBY2VFqhtdraZPArZfOUDE5LOPvSHkBZ1sjgRP+9MOG1mZ7vX9lLrom7Nj5o6JgAZPlrX5f1TaWf81qY55IoX9ATFgktZZIwIYeonkVCoihNsLqmbN1C23ji0EqH8wYqGLWFhZXpsB+JlnKkYJBoA51XU+VAH66rfyabdODZnwB2Jv2ArPuw+n5b1csb5aIfFwHWGHsCwRtSdNvbm/UGtZvPY3Vi1+p93InaICNdiSf1rA7h0GK9Zjz6qUjPVM57i51VDObWHzTCKXidY3KKwhejdrY5lpI+vS9qcfiTFxck3RHy5q7Nv0s7bFYg0FAmwWm4uQ== rsa-key-20190209'
mark_pub_key=''
greg_pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8s0vJu5cdn0vsNkcZPs3yIqWQQtlXgRTbPoPK1cMud2DGbVN4PhJPnN45CLmB1cxfqa65JIx+CRp/NMQNGko/QRY5aW5ktnNkXZfSt25Mr/N4pJYzrbDaAerpcwqmkjOWT5iIPCwztni//BsovUdSF6ExY5tnaJf2sDzC+qhD2FFfdmIoe/+ZKcAyDofUKTnbLQUCQkSrmysMChtEiUtj8FKwyE6FMIEwCznjLzkwBuCjnbtimncpwiZ71Pkk927dtIHDTG6D9xnFlkH2B40QQmrBCU5gOOhefcviweHUC3DZ+zJohVc1ajDuc6NCrSRC5g9vgg/14tL2r0jF2FMP GregTK@MacBook-Pro.local'
ryan_pub_key=''
jeff_pub_key=''
aaron_pub_key=''

users=('nelson' 'sol' 'mark' 'greg' 'ryan' 'jeff' 'aaron')

for i in "${users[@]}"
do
  : 
  # create user
  adduser $i

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

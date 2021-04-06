To download and install the latest version, run:
```
wget -O helloworld-Linux.deb https://github.com/buevich-dmitry/otus1/releases/latest/download/helloworld-Linux.deb
sudo dpkg -i helloworld-Linux.deb
```

Also you can build the project locally:
```
./build.sh
sudo dpkg -i bin/helloworld-*-Linux.deb
```

Then run helloworld app:
```
helloworld
```

# beeco-maptiles


once you are in the EC2 instance, run:
``` sh
sudo dnf install git -y
git clone https://github.com/dombovari-balazs/beeco-maptiles.git
cd beeco-maptiles
sudo sh commands.sh
```

after this script is finished, I'm running: 
``` sh 

git clone https://github.com/openmaptiles/openmaptiles.git
cd openmaptiles/
sudo ./quickstart.sh hungary
sudo make start-tileserver
```

change zoom to 14

run: 
```sh 
sudo make generate-tiles-pg
```

tile generation for Hungary with Zoom 14 is around 40 minutes


also change inbound rules to accept traffic from :8080

add custom style:
1. add custom-style/beeco-style.json to ~/build/style/beeco-style.json
2. add custom-style/config.json to ~/style/config.json



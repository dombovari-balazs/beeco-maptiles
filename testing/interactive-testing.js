import http from 'k6/http';
import { sleep } from 'k6';
import { check } from 'k6';

export let options = {
  vus: 100,
  duration: '30s',
};

function randomTileCoords(zoom) {
  const max = Math.pow(2, zoom);
  return {
    x: Math.floor(Math.random() * max),
    y: Math.floor(Math.random() * max),
  };
}

export default function () {
  const zoomLevels = [13, 14, 15];
  const zoom = zoomLevels[Math.floor(Math.random() * zoomLevels.length)];

  for (let i = 0; i < 6 + Math.floor(Math.random() * 4); i++) {
    const { x, y } = randomTileCoords(zoom);
    const url = `http://ec2-18-197-104-165.eu-central-1.compute.amazonaws.com:8080/styles/beeco/${zoom}/${x}/${y}.png`;

    let res = http.get(url);
    check(res, { 'status is 200': (r) => r.status === 200 });

    sleep(0.5 + Math.random() * 1); // simulate pause
  }
}

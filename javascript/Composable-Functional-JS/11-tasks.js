const Task = require('data.task');

const launchMissiles = () =>
  new Task((rej, res) => {
    console.log('Launch Missiles');
    res('missile');
  });

const app = launchMissiles()
  .map(x => `${x}!`);

app.map(x => `${x}!`).fork(
  e => console.log('error', e),
  x => console.log('sucess', x),
);

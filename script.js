// welcome message
console.log("Giddy Shark welcomes you");

// canvas
var cvs = document.getElementById("giddyShark");
var ctx = cvs.getContext("2d");

// objects
var shark = new Image();
var fish1 = new Image();
var fish2 = new Image();
var net = new Image();
var boat = new Image();
var background = new Image();

shark.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2Fshark.gif?v=1607125076987";
fish1.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2Ffish1.gif?v=1607123267982";
fish2.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2Ffish2.gif?v=1607123287640";
net.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2Fnet.png?v=1607123279444";
boat.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2Fboat.png?v=1607123271669";
background.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2Fbackground-3.png.png?v=1607126081132";

var swim = new Audio();
var dead = new Audio();
var score = new Audio();
var hit = new Audio();
var swoosh = new Audio();

swim.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2F7053_mystiscool_eel-fishing-1%20(online-audio-converter.com).mp3?v=1607126558297";
dead.src =
  "https://cdn.glitch.com/e16a6ed2-a3c7-4365-b036-6bda31d91b0d%2F197994_jjhouse4_short-mettalic-buzz%20(online-audio-converter.com).mp3?v=1607126768053";

score.src =
  "https://cdn.glitch.com/ae2877db-d048-445e-9006-36d3c1c5ed15%2Fscore.mp3?v=1607205026678";

hit.src =
  "https://cdn.glitch.com/ae2877db-d048-445e-9006-36d3c1c5ed15%2Fhit.mp3?v=1607205036678";

swoosh.src =
  "https://cdn.glitch.com/ae2877db-d048-445e-9006-36d3c1c5ed15%2Fswoosh.mp3?v=1607205283306";

// gap between objects
var gap = 85;

// constant of net
var constant;

// shark X and Y positions.
var bX = 10;
var bY = 150;

// shark sink by 1.5 pixels at a time.
var gravity = 1.5;

// players score
var score = 0;

// action
document.addEventListener("keydown", moveUp);

function moveUp() {
  bY -= 25;
  swim.play();
}

// danger
var danger = [];

danger[0] = {
  x: cvs.width,
  y: 0
};

function draw() {
  ctx.drawImage(background, 0, 0);

  for (var i = 0; i < danger.length; i++) {
    constant = net.height + gap;
    ctx.drawImage(net, danger[i].x, danger[i].y);
    ctx.drawImage(boat, danger[i].x, danger[i].y + constant);

    danger[i].x--;

    if (danger[i].x == 125) {
      danger.push({
        x: cvs.width,
        y: Math.floor(Math.random() * net.height) - net.height
      });
    }

    if (
      (bX + shark.width >= danger[i].x &&
        bX <= danger[i].x + net.width &&
        (bY <= danger[i].y + net.height ||
          bY + shark.height >= danger[i].y + constant)) ||
      bY + shark.height >= cvs.height - fg.height
    ) {
      location.reload();
    }

    if (danger[i].x == 5) {
      score++;
    }
  }

  ctx.drawImage(fg, 0, cvs.height - fg.height);

  ctx.drawImage(shark, bX, bY);

  bY += gravity;

  ctx.fillStyle = "#000";
  ctx.font = "20px Verdana";
  ctx.fillText("Score : " + score, 10, cvs.height - 20);

  requestAnimationFrame(draw);
}

draw();

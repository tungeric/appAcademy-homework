function init() {
  window.requestAnimationFrame(draw);
}

function draw() {
  document.addEventListener("DOMContentLoaded", function(){

  // phase 1 - set up canvas

  const canvas = document.getElementById('mycanvas');
  canvas.height = 600;
  canvas.width = 600;
  const ctx = canvas.getContext('2d');

  // phase 2 - draw a rectangle
  ctx.fillStyle = "red";
  // ctx.translate(30,0);
  ctx.fillRect(100,100,400,300);

  ctx.globalCompositeOperation = 'source-over';
  ctx.clearRect(0, 0, 600, 600); // clear canvas
  ctx.save();
  ctx.translate(10, 10);


  // phase 2 - draw a rectangle
  const time = new Date();
  ctx.fillStyle = "blue";
  ctx.translate(2*time.getSeconds(),0);
  // ctx.rotate(2*Math.PI/180*time.getSeconds());
  ctx.fillRect(100,100,400,300);
  ctx.restore();

  // phase 3 draw a circle
  // ctx.translate(-100,0);
  ctx.beginPath();
    //void ctx.arc(x, y, radius, startAngle, endAngle, anticlockwise);
    ctx.arc(400,400,30,30,60);
    ctx.strokeStyle = "green";
    ctx.lineWidth = 5;
    ctx.stroke();

    // fill in circle
    ctx.fillStyle = "purple";
    ctx.fill();
    ctx.restore();


  //random stuff

  ctx.beginPath();
    ctx.fillStyle = "green";
    ctx.moveTo(75, 50);
    ctx.lineTo(100, 75);
    ctx.lineTo(100, 25);
    ctx.fill();
    ctx.restore();

  });
  window.requestAnimationFrame(draw);

}
draw();
// init();

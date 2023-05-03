var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var img = document.getElementById('myImage');
var raf;

let image = new Image();
image.src="komar.png"

let time = 0;

window.onload = () => {
    draw();
}


function draw() {
    time++;
    
    if (time >= 50) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);

        let x = Math.random() * canvas.width - 50 
        x = x <= 0 ? 0 : x;

        let y = Math.random() * canvas.height - 60; 
        y = y <= 0 ? 0 : y;

        ctx.drawImage(image, 0, 0, 807, 946, x, y, 50, 60);
        time = 0;      
    }
    
    window.requestAnimationFrame(draw);
}

canvas.addEventListener('mouseover', function (e) {
    raf = window.requestAnimationFrame(draw);
});

canvas.addEventListener('mouseout', function (e) {
    window.cancelAnimationFrame(raf);
});






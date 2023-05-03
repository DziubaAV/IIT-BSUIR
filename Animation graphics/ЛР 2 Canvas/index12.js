let canvas12 = document.getElementById("canvas12"); 
let context12 = canvas12.getContext('2d');

let img = new Image();
img.src = '1.jpg';
img.onload = function () {
    let patt = context12.createPattern(img, 'repeat');
    context12.lineWidth = 200;
    context12.strokeStyle = patt;
    context12.moveTo(10, 100);
    context12.lineTo(450, 100);
    context12.stroke();
};
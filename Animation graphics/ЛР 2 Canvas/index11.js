let canvas11 = document.getElementById("canvas11"); 
let context11 = canvas11.getContext('2d');

gradient = context11.createRadialGradient(70, 120, 70, 400, 130, 130);
gradient.addColorStop(0.0, 'blue');
gradient.addColorStop(0.8, 'yellow');
gradient.addColorStop(1.0, 'green');
context11.strokeStyle = gradient;
context11.lineWidth = 50;
context11.moveTo(50, 100);
context11.lineTo(500, 100);
context11.stroke();
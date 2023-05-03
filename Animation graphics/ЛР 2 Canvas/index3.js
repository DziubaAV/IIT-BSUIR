let canvas3 = document.getElementById("canvas3"); 
let context3 = canvas3.getContext('2d');

context3.beginPath();
context3.moveTo(50, 50);
context3.quadraticCurveTo(100, 100, 50, 150);
context3.stroke();
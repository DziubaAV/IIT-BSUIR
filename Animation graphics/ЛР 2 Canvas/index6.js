let canvas6 = document.getElementById("canvas6"); 
let context6 = canvas6.getContext('2d');

context6.beginPath(); 
context6.moveTo(50,50); 
context6.lineTo(50,150); 
context6.lineTo(100,50); 
context6.lineTo(100,150); 
context6.stroke(); 
context6.closePath();

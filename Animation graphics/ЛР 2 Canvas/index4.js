let canvas4 = document.getElementById("canvas4"); 
let context4 = canvas4.getContext('2d');

context4.beginPath(); 
context4.moveTo(50,50); 
context4.lineTo(50,150); 
context4.moveTo(100,50); 
context4.lineTo(100,150); 
context4.stroke(); 
context4.closePath();

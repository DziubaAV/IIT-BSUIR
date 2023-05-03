let canvas5 = document.getElementById("canvas5"); 
let context5 = canvas5.getContext('2d');

context5.beginPath(); 
context5.moveTo(50,50); 
context5.lineTo(50,150); 
context5.lineTo(100,50); 
context5.lineTo(100,150); 
context5.closePath(); 
context5.stroke();

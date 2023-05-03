let canvas7 = document.getElementById("canvas7"); 
let context7 = canvas7.getContext('2d');

context7.beginPath(); 
context7.moveTo(50,50); 
context7.lineTo(50,150); 
context7.lineTo(100,50); 
context7.lineTo(100,150); 
context7.stroke(); 
context7.closePath(); 
context7.stroke();


let canvas9 = document.getElementById("canvas9"); 
let context9 = canvas9.getContext('2d');
function getRadians(grad) {
    return grad*Math.PI/180
}
context9.arc(50,50,10,0,getRadians(360)); 
context9.stroke();

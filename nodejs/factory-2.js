function showColor() {
  console.log(this.color);
}

function createCar(sColor,iDoors,iMpg) {
  var oTempCar = new Object;
  oTempCar.color = sColor;
  oTempCar.doors = iDoors;
  oTempCar.mpg = iMpg;
  oTempCar.showColor = showColor;
  oTempCar.showColor();
  return oTempCar;
}

module.exports = createCar;

//var oCar1 = createCar("red",4,23);
//var oCar2 = createCar("blue",3,25);

//oCar1.showColor();		//输出 "red"
//oCar2.showColor();		//输出 "blue"
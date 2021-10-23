/// @description vector_calc(vectorForce, vectorAngle);
/// @function  vector_calc
/// @param vectorForce
/// @param vectorAngle
function vector_calc(argument0, argument1) {

	var array

	array[0] = (argument0 / dsin(90))*dsin(argument1)
	array[1] = (argument0 / dsin(90))*dsin((90-argument1))

	return array




}
previousSum=0
currentSum=0
hasPreviousSum=0
mode="USER INPUT"
firstNumber="USER INPUT"
secondNumber="USER INPUT"

AddSum () {
 currentSum=$(($firstNumConvert+$secondNumConvert))
 if [[ $hasPreviousSum -eq 1 ]]; then
  previousSum=$(($previousSum+$currentSum))
  echo "Your number is: $previousSum"
  Menu
 else 
  previousSum=$currentSum
  echo "Your number is: $currentSum"
  hasPreviousSum=1
  Menu
 fi
}

SubtractSum () {
 currentSum=$(($firstNumConvert-$secondNumConvert))
 if [[ $hasPreviousSum -eq 1 ]]; then
  previousSum=$(($previousSum-$currentSum))
  echo "Your number is: $previousSum"
  Menu
 else 
  previousSum=$currentSum
  echo "Your number is: $currentSum"
  hasPreviousSum=1
  Menu
 fi
}

DivideSum () {
 currentSum=$(($firstNumConvert/$secondNumConvert))
 if [[ $hasPreviousSum -eq 1 ]]; then
  previousSum=$(($previousSum/$currentSum))
  echo "Your number is: $previousSum"
  Menu
 else 
  previousSum=$currentSum
  echo "Your number is: $currentSum"
  hasPreviousSum=1
  Menu
 fi
}

MultiplySum () {
 currentSum=$(($firstNumConvert*$secondNumConvert))
 if [[ $hasPreviousSum -eq 1 ]]; then
  previousSum=$(($previousSum*$currentSum))
  echo "Your number is: $previousSum"
  Menu
 else 
  previousSum=$currentSum
  echo "Your number is: $currentSum"
  hasPreviousSum=1
  Menu
 fi
}

ResetSum () {
if [[ $hasPreviousSum -eq 1]]; then
previousSum=0
Menu
else
echo "You do not have a saved sum!"
Menu
fi
}

Menu () {
read -p "Please select from one of the following options: 1= Add 2= Subtract 3= Divide 4= Multiply 5= Reset sum 6= exit: " mode
if [[ $mode == "5" ]]; then 
ResetSum
fi
read -p "Please enter your first number: " firstNumber
firstNumConvert="$firstNumber"
read -p "Please enter your second number: " secondNumber
secondNumConvert="$secondNumber"
if [[ $input == "1" ]]; then
AddSum "$firstNumber" "$secondNumber"
elif [[ $input == "2"]]; then
SubtractSum "$firstNumber" "$secondNumber"
elif [[ $input == "3"]]; then
DivideSum "$firstNumber" "$secondNumber"
elif [[ $input == "4"]]; then
MultiplySum "$firstNumber" "$secondNumber"
elif [[ $input == "6"]]; then
exit
else 
echo "Please input a number!"
Menu
fi
}

Menu
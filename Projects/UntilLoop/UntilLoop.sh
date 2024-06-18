x=5
y=10
until [[ $x -eq 0 || $y -eq 0]]
do
echo "X = $x. Y = $y"
((x--))
((y-=2))
done
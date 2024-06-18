passwordResults="USER INPUT"
passwordLength="USER INPUT"
useSpecialChars=0
remainingResults=$passwordResults

read -p "How many results do you wish to print? " passwordResults
read -p "How many characters do you want in your password? " passwordLength
passwordResultVar=$((passwordResults))
passwordLengthResult=$((passwordLength))

until [[ $passwordResultVar -eq 0 ]]; do
password=$(cat /dev/urandom | tr -dc '[:graph:]' |fold -w $passwordLengthResult| head -n 1)
echo "$password"
echo #
((passwordResultVar-=1))
done

#To do: Add in a way for the user to choose for special characters to be added.
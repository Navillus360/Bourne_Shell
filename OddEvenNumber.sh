NumberPrompt () {
  userNum="USER INPUT"
  read -p "Input a number" userNum
  userNumInt=$((userNum))
  if [[ $((userNumInt%2) -eq 0) ]]; then
    echo "Your number is even"
    echo #
    PromptRetry
  else
    echo "Your number is odd"
    echo #
    PromptRetry
  fi
}

PromptRetry () {
  retryAnswer="USER INPUT"
  read -p "Retry [Y/n]" retryAnswer
  if [[ $retryAnswer == "Y" || $retryAnswer == "y" ]]; then
    echo #
    NumberPrompt
  elif [[ $retryAnswer == "N" || $retryAnswer == "n" ]]; then
    echo #
  else
    echo "Please choose Y or n"
    PromptRetry
  fi
}
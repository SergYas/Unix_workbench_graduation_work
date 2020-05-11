#!/usr/bin/env bash
# File: guessinggame.sh
game_answer_checker ()
{
	while ! [[ $(echo $game_answer | egrep ^[0-9]+$) ]]; do
		echo -n "If you really wanna play, enter integer value: "; read game_answer
	done
	let game_answer=$(echo $((10#$game_answer))) #deleting leading zeros and spaces
}
echo -n "Hello! Try to guess how many files are in current directory (integer value, please): "
read game_answer
game_answer_checker
true_answer=$(ls -la | cut -c 1 | grep - | wc -l)
while [[ $true_answer -ne $game_answer ]]; do
	if [[ $true_answer -lt $game_answer ]]; then
		echo -n "Not so much, try again: "
	else echo -n "Try a little more: "
	fi
read game_answer; game_answer_checker
done
echo "Yeah, $true_answer is true! Сongratulations!"

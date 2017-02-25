#!/bin/sh
# shell script to prepend i3status with more stuff

#i3status | while :
#do
#  read line
#  echo "mystuff | $line" || exit 1
#done

# i3status | while :
# do
#  read line
  # echo "asdf" || exit 1
  # echo "\"full_text\":\"${rate}\" },${line#,\[}" || exit 0
#  echo "[{full_text: asdf}]$line" || exit 1
# done

function death_object {
  ### count the amount of time till death ###
  # current timestamp
  local timestamp=$(date +%s)
  # seconds till death
  #####################
  # change your life expectancy here:
  # change 2345678000 to a timestamp of the age you expect to live:
  #####################
  local ts2=$((2345678000 - $timestamp - 3600))
  # days till death
  local days=$(($ts2 / 3600 / 24))
  # hours till end of the day
  local hours=$((($ts2 % (3600 * 24)) / 3600 ))
  # minutes till end of the hour
  local minutes=$(($ts2 % 3600 / 60))
  # seconds till end of the minute
  local seconds=$(($ts2 % 60))
  # format for output
  local death_text=$days"d $(printf "%02d" $hours):$(printf "%02d" $minutes):$(printf "%02d" $seconds) ☠ "
  local death_color="#ffff00"
  # echo the time_till_death
  echo "{\"full_text\":\"$death_text\",\"color\":\"$death_color\"},"
}


function seconds_till_birthday {
  function bs {
    #####################
    # change the date of your birthday here
    #####################
    echo $(($(date --date="01/17/$1 00:00:00" +"%s") - $(date +"%s")))
  }

  # what is the year now?
  local year=$(date +"%Y")

  local seconds=$(bs $year)
  if (($seconds<0)); then
    local year=$(($year + 1))
    local seconds=$(bs $year)
  fi
  echo $seconds
}

function birthday_object {


  local birthday_weeks=$(($(seconds_till_birthday)/(7 * 24 * 3600)))
  local birthday_days=$((($(seconds_till_birthday) % (7 * 24 * 3600)) / (24 * 3600)))

  local birthday_text=$birthday_weeks"w"$birthday_days"d ⌛"
  local birthday_color="#ff8800"

  echo "{\"full_text\":\"$birthday_text\",\"color\":\"$birthday_color\"},"
}

i3status | (read line && echo $line && read line && echo $line && read line && echo $line && while :
do
  # read the i3status and trim array beginning
  read line
  lineout=${line#",["}
  # start the output: print the ,[
  echo ",["
  # print the amount of weeks till birthday
  echo $(birthday_object)
  # print the amount of time till death
  echo $(death_object)
  # print the rest of the i3status
  echo $lineout || exit 1
done
)

#!/bin/bash
#
# Greg G
# 2010-05-22
#
# REQUIRED -------------------------------------------------------------
#
# gifsicle  
# imagemagick
#
# gifview comes with gifsicle, a lightweight gif viewer
#
# USAGE ----------------------------------------------------------------
#
# radar.sh [update] [purge]
#
# [update] retrieves the latest image from the appropriate sever for all
# regions in REGION_LIST
# URL_NOAA server updates at a 10 minute interval. 
# URL_INTELLICAST server updates at 15 minute interval.
#
# [purge] removes all frames for all regions in REGION_LIST
#
# Must use either 'update' or 'purge'
#
# CRONTAB --------------------------------------------------------------
#
# */10 * * * * ~/scripts/radar/radar.sh update
#
# ----------------------------------------------------------------------
#
# Region serves as the root filename when downloading the most recent
# image from the IMAGE_SERVER_URL
#
# ----------------------------------------------------------------------
#
# Intellicast radar regions
#
# usa - Continental US
# lit - AR, Little Rock
# prc - AZ, Prescott
# bfl - CA, Bakersfield
# den - CO, Denver
# hfd - CT, Hartford
# eyw - FL, Key West
# pie - FL, St Petersburg
# dsm - IA, Des Moines
# myl - ID, McCall
# spi - IL, Springfield
# sln - KS, Salina
# bwg - KY, Bowling Green
# msy - LA, New Orleans
# cad - MI, Cadillac
# stc - MN, St Cloud
# jef - MO, Jefferson City
# tvr - MS, Vicksburg
# lwt - MT, Lewistown
# clt - NC, Charlotte
# bis - ND, Bismarck
# lbf - NE, North Platte
# bml - NH, Berlin
# row - NM, Roswell
# rno - NV, Reno
# bgm - NY, Binghamton
# day - OH, Dayton
# law - OK, Lawton
# rdm - OR, Redmond
# pir - SD, Pierre
# bro - TX, Brownsville
# sat - TX, San Antonio
# pvu - UT, Provo
# fcx - VA, Roanoake
# shd - VA, Staunton
# tiw - WA, Tacoma
# riw - WY, Riverton
#
#Raycom Media States
# ak - Alaska
# al - Alabama
# ar - Arkansas
# as - American Samoa
# az - Arizona
# ca - California
# co - Colorado
# ct - Connecticut
# dc - District of Columbia
# de - Delaware
# fl - Florida
# ga - Georgia
# gu - Guam
# hi - Hawaii
# ia - Iowa
# id - Idaho
# il - Illinois
# in - Indiana
# ks - Kansas
# ky - Kentucky
# la - Louisiana
# ma - Massachusetts
# md - Maryland
# me - Maine
# mi - Michigan
# mn - Minnesota
# mo - Missouri
# ms - Mississippi
# mt - Montana
# nc - North Carolina
# nd - North Dakota
# ne - Nebraska
# nh - New Hampshire
# nj - New Jersey
# nm - New Mexico
# nv - Nevada
# ny - New York
# oh - Ohio
# ok - Oklahoma
# or - Oregon
# pa - Pennsylvania
# pr - Puerto Rico
# ri - Rhode Island
# sc - South Carolina
# sd - South Dakota
# tn - Tennessee
# tx - Texas
# ut - Utah
# va - Virginia
# vi - Virgin Islands
# vt - Vermont
# wa - Washington
# wi - Wisconsin
# wv - West Virginia
# wy - Wyoming 
#
#FORMERLY USED
#usa
#day
#spi
#bwg
#cad
#

#  If the colors are too bright, add this line back at line number 374. Remove the hash.
# mogrify -modulate 100,30,100 $TARGETIMAGE_FILENAME.*
# This line modifies the size of the gifs, unnecessary for the way it is used here.
# mogrify -resize x350 $TARGETIMAGE_FILENAME.*

# ----------------------------------------------------------------------

URL_INTELLICAST="http://images.intellicast.com/WxImages/Radar"
URL_INTELLICAST_ANIMATED="http://images.intellicast.com/WxImages/RadarLoop"
URL_NOAA="http://radar.weather.gov/ridge/Conus/RadarImg"
URL_NOAA_ANIMATED="http://radar.weather.gov/Conus/Loop"

# Number lines to keep the log file at, 0 disables logging
LOGFILE_LINES=25

# Place any regions from arrays below here to have updated with 'radar.sh update'
REGION_LIST="
usa
cad
bwg
day
spi
"

REGION_LIST_NOAA="
Nat
alaska
centgrtlakes
greatlakes
hawaii
latest
northeast
northrockies
pacnorthwest
pacsouthwest
southeast
southmissvly
southplains
southrockies
uppermissvly
"

REGION_LIST_INTELLICAST="
usa
lit
prc
bfl
den
hfd
eyw
pie
dsm
myl
spi
sln
bwg
msy
cad
stc
jef
tvr
lwt
clt
bis
lbf
bml
row
rno
bgm
day
law
rdm
pir
bro
sat
pvu
fcx
shd
tiw
riw" 

SCRIPT_PATH=`dirname "$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"`
TARGETIMAGE_URL=""
TARGETIMAGE_FILENAME=""
ANIMATION_FILENAME=""
LOGFILE_NAME="$SCRIPT_PATH"/"radar.log"


updatelog() {

    if [ -n "$1" ] && [ $LOGFILE_LINES -gt 0 ]; then
        echo "`date +"%b %d %H:%M:%S"` $1" >> $LOGFILE_NAME
    fi

    if [ -f $LOGFILE_NAME ]; then
        linecount=`wc -l "$LOGFILE_NAME"`
        linecount=${linecount% *}
        if [ $linecount -gt $LOGFILE_LINES ]; then
            awk 'FNR>1' < $LOGFILE_NAME > tmp.log ; mv tmp.log $LOGFILE_NAME
        fi
    fi
}

validate_region() {

    for noaaregionitem in $REGION_LIST_NOAA
        do
            if [ $noaaregionitem == $1 ]; then return 0
            fi
        done

    for intellicastregionitem in $REGION_LIST_INTELLICAST
        do
            if [ $intellicastregionitem == $1 ]; then return 0
            fi
        done
    
    for raycomregionitem in $REGION_LIST_RAYCOM
        do
            if [ $raycomregionitem == $1 ]; then return 0
            fi
        done

    return 1
}
    
set_targetimage_info() {

    for urlregionitem in $REGION_LIST_INTELLICAST
    do
        if [ "$urlregionitem" == "$1" ]; then
            TARGETIMAGE_URL="$URL_INTELLICAST_ANIMATED"
            TARGETIMAGE_FILENAME="$1"_None_anim.gif
            ANIMATION_FILENAME="$1"-animated.gif
        fi
    done

    for urlregionitem in $REGION_LIST_NOAA
    do
        if [ "$urlregionitem" == "$1" ]; then
            TARGETIMAGE_URL="$URL_NOAA_ANIMATED"
            TARGETIMAGE_FILENAME="$1"_loop.gif
            # fix inconsistency in file naming convention
            if [ "$urlregionitem" == "Nat" ]; then TARGETIMAGE_FILENAME="$1"Loop.gif
            fi
            ANIMATION_FILENAME="$1"-animated.gif

        fi
    done

    for urlregionitem in $REGION_LIST_RAYCOM
    do
        if [ "$urlregionitem" == "$1" ]; then
            TARGETIMAGE_URL="$URL_RAYCOM_ANIMATED"
            TARGETIMAGE_FILENAME=us-"$1"_radar_d505x380_loop.gif
            ANIMATION_FILENAME="$1"-animated.gif

        fi
    done
 
    }

update() {

    cd $SCRIPT_PATH
    
    for regionitem in $REGION_LIST
    do
        validate_region $regionitem
        isvalid=$?
        if [ $isvalid -eq 0 ]; then
            mkdir -p $regionitem
            cd $SCRIPT_PATH/$regionitem
            set_targetimage_info $regionitem
            wget -q -N -t 1 $TARGETIMAGE_URL/$TARGETIMAGE_FILENAME
            if [ $TARGETIMAGE_FILENAME -nt $ANIMATION_FILENAME ]; then
                moddate=$(stat -c %y $TARGETIMAGE_FILENAME)        
                gifsicle -w -e --unoptimize --crop-transparency $TARGETIMAGE_FILENAME
				#  If the colors are too bright, remove the hash below to dim.
                mogrify -modulate 100,100,100 $TARGETIMAGE_FILENAME.*
                # crops the NOAA 'Nat' image to show only the Eastern half of the United States
                if [ $regionitem == "Nat" ]; then mogrify -gravity East -crop 376x-8+0 +repage $TARGETIMAGE_FILENAME.*
                fi
                gifsicle -w -m -O2 -l $TARGETIMAGE_FILENAME.* -o $ANIMATION_FILENAME
                touch -d "${moddate}" $ANIMATION_FILENAME
                updatelog "updated         : $regionitem"
            else
                updatelog "no update       : $regionitem"
            fi
        else
            echo "$regionitem is invalid"
            updatelog "invalid region  : $regionitem"
        fi
        cd $SCRIPT_PATH
    done

}


cd $SCRIPT_PATH

case $1 in
    "update")
        update
        ;;

     "purge")
        for regionitem in $REGION_LIST
        do
            rm -rf $regionitem
        done            
        echo "purged all frames."
        updatelog "purge           : purged all frames"
        echo
        ;;

      *)
        echo
        echo "Usage : $0 [update ] [purge]"
        echo
        echo "'update'     retrieves the latest image from the appropriate server for all regions"
        echo "'purge'      removes frames for all regions in REGION_LIST"
        echo
        exit 1
esac

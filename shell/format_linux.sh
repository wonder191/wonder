################################################
#                                              #
#         for linux system                     #
#         version 1.0                          #
#         create by wonder                     #
#         2017-09-15                           #
################################################

#judge the parameters number
if [[ $# < 1 ]] || [[ $# > 2 ]] ;then
    echo ""
    echo "Warnning: Must have one or two parameter!"
    echo "Usage:
    sh $(basename $0) test.log               //format test.log with row number[default]
    sh $(basename $0) sample.log --withnorn  //format sample.log without row number"
    echo ""

elif [[ ! -f $1 ]];then
    echo ""
    echo "Warnning: file $1 not found!"
    echo ""
else

#if only one parameter to give, and file exist
if [[ $# -eq 1 ]];then

    linecount=`cat $1 | awk '{num=length($0);if (num>max) max=num}END{print max}'`
    rownumlen=`cat $1|wc -l|awk '{print length($0)}'`
    headcount=$((linecount+rownumlen+7))
    printhead_withrn()
    {
        i=1
        while (( $i <= $headcount ))
        do
            if [[ $i -eq 1 ]] || [[ $i -eq $((rownumlen+4)) ]]
            then
                echo -n "+"
            elif [[ $i -eq $headcount ]];then
                echo  "+"
            else
                echo -n "-"
            fi
            (( i=i+1 ))
        done
}
    printhead_withrn
    cat $1 | awk '{printf "| %-'$rownumlen's ""| %-'$linecount's |\n",NR,$0}'
    printhead_withrn
    exit
fi

#two parameters to give, if not the define parameter then warnning
if [[ $2 = "--withnorn" ]];then
    linecount=`cat $1 | awk '{num=length($0);if (num>max) max=num}END{print max}'`
    rownumlen=`cat $1|wc -l|awk '{print length($0)}'`
    headcount=$((linecount+4))
    printhead_withoutrn()
    {
        i=1
        while (( $i <= $headcount ))
        do
            if [[ $i -eq 1 ]] 
            then
                echo -n "+"
            elif [[ $i -eq $headcount ]]
            then
                echo  "+"
            else
                echo -n "-"
            fi
            (( i=i+1 ))
        done
    }

    printhead_withoutrn
    cat $1 | awk '{printf "| %-'$linecount's |\n",$0}'
    printhead_withoutrn
else
    echo ""
    echo "Warring: Wrong parameter $2,check again!"
    echo ""
fi

fi

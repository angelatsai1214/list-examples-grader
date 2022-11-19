# Create your grading script here

# set -e

CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

cd student-submission/

FILE="ListExamples.java"

# Check if the correct files were submitted
if [ -f $FILE ]
then
        echo "Correct files submitted"
else
        echo "Submitted file has the wrong name or path"
        exit 1
fi

TESTFILE="TestListExamples.java"

# Copy test file to student-submission folder if not already exist
if [[ -s TESTFILE ]]
then
        echo "Test file already exist"
        cd ..
else
        cd ..
        cp TestListExamples.java student-submission/
        echo "Test file copied to student-submission folder"
fi

cp -r lib student-submission/
echo "lib folder copied over"

cd student-submission
echo "In student-submission"

javac -cp $CP *.java 2> compiledResults.txt

# Check if there was a compiler error
ERRORNUMS=$( grep -o 'error' compiledResults.txt | wc -l | xargs )
if [ $ERRORNUMS -eq 0 ]
then
        echo "Compiled"
else
        echo "You have COMPILER ERROR"
        exit 1
fi

TOTALTESTS=2

# Remove results.txt if it exists already
# if [[ -s results.txt ]]
# then
#        rm results.txt
# fi

java -cp $CP org.junit.runner.JUnitCore TestListExamples > results.txt

echo "Ran Junit Tests"

# Remove testResults.txt if it exists already
# if [[ -s testResults.txt ]]
# then
#        rm testResults.txt
# fi

# sed -n '10,13p' results.txt > testResults.txt
awk 'NR>=11 && NR<=13' results.txt > testResults.txt

ERROR=$(grep -o 'E' testResults.txt | wc  -l | xargs )
echo "Number of tests failed: $ERROR"
CORRECT=$(( $TOTALTESTS-$ERROR ))
GRADE=$(( ($CORRECT/$TOTALTESTS)*100 ))

echo "Grade: $GRADE"

set -e

CP=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

cd student-submission/

FILE="ListExamples.java"

if [ -f $FILE ]
then
        echo "Correct files submitted"
else
        echo "Incorrect files submitted"
        exit 1
fi

cd ..

cp ListTests.java student-submission/
echo "GradeTest copied over"

cp -r lib student-submission/
echo "lib folder copied over"

cd student-submission
echo "In student-submission"

javac -cp $CP *.java
echo "Compiled"

java -cp $CP org.junit.runner.JUnitCore  ListTests
echo "Ran"

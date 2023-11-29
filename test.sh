CPATH='.;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point
if [[ -f "./student-submission/ListExamples.java" ]];
then
echo "Correct file";
else
echo "Wrong file";
exit 1
fi

files='find ./student-submission/*.java ./TestListExamples.java'

for file in $files
do
    if [[ -f $file ]]
    then
        cp -r $file './grading-area'
    fi
done

# Then, add here code to compile and run, and do any post-processing of the
# tests
#set -e
cd ./grading-area
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > out.txt

if [[ $? -eq 0 ]];
then 
    echo "Right File submitted"
else  
    echo "Wrong File Submitted"
fi



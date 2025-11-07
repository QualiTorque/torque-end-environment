#!/bin/sh -l

ENV_ID="$1"
SPACE="$2"

echo "Ending environment with id '${ENV_ID}' in space '${SPACE}'"
params="\"${ENV_ID}\" --space \"${SPACE}\""

command="/Quali.Torque.Cli/torque-cli env end ${params} --token $TORQUE_TOKEN"
echo "The following command will be executed: ${command}"

echo "Ending environment..."
response=$(eval $command 2>&1)
exit_code=$?
if [ $exit_code -ne 0 ]; then
    echo "Error: Failed to end environment"
    echo "$response"
    exit $exit_code
fi

echo "Environment ended successfully."

echo "Writing data to outputs"
echo "environment_id=${ENV_ID}" >> $GITHUB_OUTPUT


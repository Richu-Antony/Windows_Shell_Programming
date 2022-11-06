# Purpose:
# To copy files from one machine to a bunch of other machines especially if these machine are QA agents.

$updatedFolder = "C:\Dev\Artifcats"
$machines = @(
"MachineName1",
"MachineName2",
"MachineName3",
"MachineName4"
)

foreach ($machine in $machines)
{
    $workerpath = "\\" + $machine + "\c$\"
	Copy-Item -Force -Recurse -Verbose $updatedFolder -Destination $workerpath
}
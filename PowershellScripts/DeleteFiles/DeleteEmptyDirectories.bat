:: Purpose:
:: To delete empty directories from local drive or shared file share.
for /f "delims=" %d in ('dir /s /b /ad ^| sort /r') do rd "%d"
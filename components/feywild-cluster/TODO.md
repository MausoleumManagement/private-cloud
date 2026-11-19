cert renewal. just fetch, convert to base64 and drop into file; the pco certs expire quite quickly

define proper externalsecrets for the productive deployment once we are happy with how things work

store relevant secrets in openbao

then nuke gitignored credential files

terraform:
- ssh key
- floating IP maybe via some kind of return parameter
- then pipe those things into the clusterctl generation command
- goal: have a quickly reproducible environment. Tear down and recreate in minutes

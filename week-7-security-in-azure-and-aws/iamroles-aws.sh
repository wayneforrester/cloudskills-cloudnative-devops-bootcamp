# Create an IAM user
aws iam create-user --user-name Wayne

# Create an IAM group
aws iam create-group --group-name Waynes-Group

# Add user to group
aws iam add-user-to-group --user-name Wayne --group-name Waynes-Group
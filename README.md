# Create Server in Scaleway with Terraform

## Prepare workspace
Get your credentials at [ScaleWay](https://console.scaleway.com/project/credentials).
Make sure to create API keys fo the Organization and not the user

Set your credentials as environment variable in your workspace. 
Add the following lines to /home/abc/.zshrc:

```
export SCW_DEFAULT_PROJECT_ID=<YOUR_PROJECT_ID>
export SCW_ACCESS_KEY=<YOUR_ACCESS_KEY>
export SCW_SECRET_KEY=<YOUR_SECRET_KEY>
```

## Terraform

- Initialize terraform project 
```
terraform init
```
- Show Terraform plan
```
terraform plan
```
- Apply to create new ifrastructure
```
terraform apply
```
- Destroy infrastructure completely
```
terraform destroy
```




- Save project to GitHub
```
git init
git add *
git commit -m "Initial commit"
git branch -M main
git remote add origin <repo url>
git push -f origin main
oy
```

- Update project
```

git add *
git commit -m "Initial commit"
git push
```


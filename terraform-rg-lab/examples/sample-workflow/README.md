# Sample Logic App Workflow

This folder contains a small Request/Response workflow definition that can be imported into the Logic App after Terraform creates the workflow resource.

## Deploy the sample workflow

1. Deploy or update the infrastructure:

   ```powershell
   terraform init
   terraform validate
   terraform plan
   terraform apply
   ```

2. Import the workflow definition into the Logic App:

   ```powershell
   az logic workflow update `
     --resource-group "<resource-group-name>" `
     --name "<logic-app-name>" `
     --definition "@examples/sample-workflow/workflow.json"
   ```

3. Get the callback URL for testing:

   ```powershell
   az logic workflow show `
     --resource-group "<resource-group-name>" `
     --name "<logic-app-name>"
   ```

   For a Request trigger, use the Azure portal or Azure CLI trigger callback URL command to retrieve the signed callback URL before invoking it.

4. Test with a sample payload:

   ```powershell
   Invoke-RestMethod `
     -Method Post `
     -Uri "<request-trigger-callback-url>" `
     -ContentType "application/json" `
     -Body '{"correlationId":"test-001","message":"private workflow smoke test"}'
   ```

## Private networking note

The current Terraform project creates a private endpoint and private DNS zone for the Storage Account blob endpoint. That protects Storage Account blob traffic through `privatelink.blob.core.windows.net`.

The current Logic App resource is `azurerm_logic_app_workflow`, which is the Consumption style Logic App. If the requirement is that the Logic App itself is reachable only through a private endpoint, move the Logic App to Logic App Standard hosting and add:

- An App Service plan / Workflow Standard hosting model.
- A storage account for the Logic App Standard runtime.
- VNet integration for outbound private access.
- A private endpoint for the Logic App inbound endpoint.
- Private DNS for the App Service private endpoint zone.
- Managed identity RBAC for Key Vault and Storage.

For banking-style deployments, also keep public network access disabled on protected PaaS services wherever the Azure resource supports it, verify private DNS from inside the VNet, and grant identities only the minimum roles needed.

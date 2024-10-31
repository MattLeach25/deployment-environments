@description('Location for all resources.')
param location string = resourceGroup().location

@description('Machine learning workspace name')
param machineLearningName string = 'mlws-${uniqueString(resourceGroup().id)}'

resource machineLearning 'Microsoft.MachineLearningServices/workspaces@2022-05-01' = {
  name: machineLearningName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    // workspace organization
    friendlyName: machineLearningName
    description: 'Machine Learning workspace'

    // configuration for workspaces with private link endpoint
    imageBuildCompute: 'cluster001'
    publicNetworkAccess: 'Enabled'
  }
}


#!/bin/bash

set -e

## Create the clusters
az group create --resource-group west-cluster-rg --location westus 
az group create --resource-group east-cluster-rg --location eastus

az aks create --name west-cluster  \
              --resource-group west-cluster-rg \
              --node-count 1 \
              -s Standard_D2_v2 

az aks create --name west-cluster  \
              --resource-group west-cluster-rg \
              --node-count 1 \
              -s Standard_D2_v2 &

az aks create --name east-cluster  \
              --resource-group east-cluster-rg \
              --node-count 1 \
              -s Standard_D3_v2

sleep 20

## Configure access via kubectl
az aks get-credentials --resource-group west-cluster-rg --name west-cluster --overwrite-existing
az aks get-credentials --resource-group east-cluster-rg --name east-cluster --overwrite-existing

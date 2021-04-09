#!/bin/bash

az aks stop --name west-cluster  \
              --resource-group west-cluster-rg 

az aks stop --name east-cluster  \
              --resource-group east-cluster-rg 

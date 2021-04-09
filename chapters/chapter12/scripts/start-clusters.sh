#!/bin/bash

az aks start --name west-cluster  \
              --resource-group west-cluster-rg 

az aks start --name east-cluster  \
              --resource-group east-cluster-rg 

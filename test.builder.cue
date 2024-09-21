package main

import (
	"stakpak.dev/devx/v2alpha1"
	azure "stakpak.dev/devx/v1/transformers/terraform/azure"
)

builders: v2alpha1.#Environments & {
	prod: {
		flows: {
			"azure/add-firewall": pipeline: [
				azure.#AddAzureAKSFirewall & {
					azure: {
						resourceGroupName: "fwrg"
						vnetName: "fwvnet"
						location: "East US"
					}
					policy: {
						priority: 100
						collection: {
							priority: 100
							name: "fwtesting"
							action: "Allow"
						}
						rule: {
							name: "fwtesting"
							source_addresses: ["*"]
							destination_addresses: ["*"]
							destination_ports: [8080, 9090]
							
						}

					}
				},
			]
		}
	}
}